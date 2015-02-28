package com.apilizbox.business;

import com.apilizbox.entity.DocumentEntity;
import com.apilizbox.entity.PartageEntity;
import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.exception.*;
import com.apilizbox.repository.DocumentRepository;
import com.apilizbox.repository.PartageRepository;
import com.apilizbox.repository.PlanRepository;
import com.apilizbox.repository.UtilisateurRepository;
import com.apilizbox.utils.ConnectUser;
import com.apilizbox.utils.DocumentDownloadFacade;
import com.apilizbox.utils.DocumentsRights;
import com.apilizbox.utils.Notifications;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.*;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created by laurent on 15/02/2014.
 */
@Service
public class DocumentBusiness {
    @Autowired
    DocumentRepository documentRepository;
    @Autowired
    UtilisateurRepository utilisateurRepository;
    @Autowired
    PartageRepository partageRepository;
    @Autowired
    ConnectUser connectUser;
    @Autowired
    RightsBusiness rightsBusiness;
    @Autowired
    NotificationBusiness notificationBusiness;
    @Autowired
    PlanRepository planRepository;

    /**
     * Dossier de stockage des documents
     * target/apilizbox2/WEB-INF/classes/FileLibrary
     */
    private ClassPathResource FileLibrary = new ClassPathResource("FileLibrary/");
    /**
     * Id du dossier root VIRTUEL
     */
    private String rootFolder = "0";
    /**
     * Id du dossier de partage VIRTUEL
     */
    private String shareFolderId = "shareFolderId";
    /**
     * Nom du dossier de partage
     */
    private String shareFolderName = "Partages privés";
    /**
     * Taille maximum autorisé pour l'upload via le Web
     */
    @Value("${upload.realMaxSizeWeb}")
    private int maxUploadSizeWeb;
    /**
     * Taille maximum autorisé pour l'upload via les applications tiers
     */
    @Value("${upload.realMaxSizeApps}")
    private int maxUploadSizeApps;

    private int convertOToGo = 1024*1024*1024;
    private int convertOToMo = 1024*1024;

    /**
     * Récupération de la liste des documents d'un utilisateur à la racine de sa box
     * @return
     * @throws ConnectUserException
     */
    @Transactional
    public List<DocumentEntity> findRootFileByUser() throws ConnectUserException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        List<DocumentEntity> rootDocuments = documentRepository.findAllByUserAndDossierparentOrderByEstfichierAsc(userRequest.getId(), rootFolder);

        DocumentEntity shareFolder = getShareFolder();
        rootDocuments.add(shareFolder);
        return rootDocuments;
    }

    /**
     * idDossierParent correspond à 'id du dossier que l'on souhaite ouvrir (qui correspond au dossier parent des fichiers qui seront renvoyés)
     * @param idDossierParent
     * @return
     * @throws ConnectUserException
     */
    @Transactional
    public List<DocumentEntity> findFolderContent(String idDossierParent, boolean withReturnFolder) throws ConnectUserException {
        if(idDossierParent.equals(shareFolderId)){
            return getDocumentSharedToMe();
        }else if(idDossierParent == null || idDossierParent.equals(rootFolder)){
            return this.findRootFileByUser();
        }else{
            UtilisateurEntity userRequest = connectUser.getConnectedUser();
            List<DocumentEntity> documentsList = new ArrayList<DocumentEntity>();

            //Ajout du dossier "return" à la liste
            if(withReturnFolder)
                documentsList.add(this.getReturnFolder(idDossierParent));
            //Ajout du dossier "return" à la liste

            documentsList.addAll(documentRepository.findAllByUserAndDossierparentOrderByEstfichierAsc(userRequest.getId(),idDossierParent));
            return documentsList;
        }
    }

    /**
     * Méthode de suppression d'un document
     * @param id
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws IOException
     * @throws RightException
     * @throws PartageException
     */
    @Transactional
    public void remove(String id) throws ConnectUserException, DocumentException, IOException, RightException, PartageException {
        DocumentEntity documentEntity = rightsBusiness.checkRight(id, DocumentsRights.RIGHT_REMOVE);
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        if(documentEntity.getEstfichier() == 1){
            //On supprime tous les partages associés
            List<PartageEntity> partageEntityList = partageRepository.findAllByDocument(documentEntity.getId());
            for(PartageEntity partageEntity : partageEntityList){
                partageRepository.delete(partageEntity);
                if(partageEntity.getRecepteur().getId() != userRequest.getId()) {
                    notificationBusiness.create(Notifications.NotificationRemoveFileShared.type, partageEntity.getRecepteur().getId(), userRequest.getId(), documentEntity.getId());
                }
            }
            if(userRequest.getId() != documentEntity.getUser()) {
                notificationBusiness.create(Notifications.NotificationRemoveFileShared.type, documentEntity.getUser(), userRequest.getId(), documentEntity.getId());
            }
            File file = getFile(documentEntity.getId());
            if(file.exists()){
                file.delete();
            }
        }else{
            if(findFolderContent(documentEntity.getId(),false).size()>0){
                throw new DocumentException("warning", "Veuillez vider le contenu de ce dossier avant de le supprimer.");
            }
        }
        documentRepository.delete(documentEntity);
    }

    /**
     * Méthode de création d'un dossier
     * @param documentEntity
     * @return
     * @throws ConnectUserException
     * @throws DocumentException
     */
    @Transactional
    public DocumentEntity createFolder(@Valid DocumentEntity documentEntity) throws ConnectUserException, DocumentException {
        int userId = connectUser.getConnectedUser().getId();
        if(documentEntity.getDossierparent().equals(shareFolderId)){
            throw new DocumentException("Error","Le dossier de partage n'est pas éditable.");
        }
        if(documentEntity.getDossierparent() == null){
            documentEntity.setDossierparent(rootFolder);
        }
        if(documentRepository.countByNomAndExtensionAndDossierparentAndUser(documentEntity.getNom(), documentEntity.getExtension(), documentEntity.getDossierparent(), userId) > 0){
            if(documentEntity.getEstfichier()==(byte)1)
                throw new DocumentException("Error", "Un fichier portant le même nom existe déjà dans ce dossier.");
            else
                throw new DocumentException("Error", "Un dossier portant le même nom existe déjà dans ce dossier.");
        }
        if(documentEntity.getNom().equals("") || documentEntity.getNom() == null){
            throw new DocumentException("Warning", "Le nom du dossier ne peut pas être vide.");
        }
        documentEntity.setDossierparent(documentEntity.getDossierparent());
        documentEntity.setEstfichier(Byte.parseByte("0"));
        documentEntity.setTypefichier("dossier");
        documentEntity.setUser(userId);
        documentEntity.setCreation(new Timestamp(new Date().getTime()));
        documentEntity.setModification(new Timestamp(new Date().getTime()));
        documentEntity.setId(UUID.randomUUID().toString());
        return documentRepository.save(documentEntity);
    }

    /**
     * Méthode permettant de modifier l'organisation des documents dans l'arborescence
     * @param idDossier
     * @param idDocument
     * @return
     * @throws DocumentException
     * @throws RightException
     * @throws ConnectUserException
     */
    @Transactional
    public DocumentEntity move(String idDossier, String idDocument) throws DocumentException, RightException, ConnectUserException {
        int userId = connectUser.getConnectedUser().getId();
        DocumentEntity document = rightsBusiness.checkRight(idDocument,DocumentsRights.RIGHT_MOVE);
        rightsBusiness.checkRight(idDossier, DocumentsRights.RIGHT_TOMOVEIN);
        if(documentRepository.countByNomAndExtensionAndDossierparentAndUser(document.getNom(), document.getExtension(), idDossier, userId) > 0){
            if(document.getEstfichier()==(byte)1)
                throw new DocumentException("Error", "Un fichier portant le même nom existe déjà dans ce dossier.");
            else
                throw new DocumentException("Error", "Un dossier portant le même nom existe déjà dans ce dossier.");
        }
        if(idDossier.equals(shareFolderId)){
            throw new DocumentException("Error", "Impossible de déplacer un document dans le dossier des partages privés");
        }
        if(idDossier.equals(document.getId())){
            throw new DocumentException("Error", "Opération non rationnelle.");
        }
        document.setDossierparent(idDossier);
        document.setModification(new Timestamp(new Date().getTime()));
        return documentRepository.save(document);
    }

    /**
     * Permet de récupèrer l'arborescence parente à un document (utile pour le fil d'Arianne)
     * @param id
     * @return
     * @throws DocumentException
     * @throws ConnectUserException
     * @throws RightException
     */
    @Transactional
    public List<DocumentEntity> findArborescence(String id) throws DocumentException, ConnectUserException, RightException {
        List<DocumentEntity> documentEntityList = new ArrayList<DocumentEntity>();
        if(id.equals(shareFolderId)){
            documentEntityList.add(getShareFolder());
        }else if(id == null || id.equals(rootFolder)){ }else{
            DocumentEntity documentEntityFound = rightsBusiness.checkRight(id, DocumentsRights.RIGHT_GETFORARBO);
            if(documentEntityFound.getEstfichier()==1){
                throw new DocumentException("Other", "Ce document n'est pas un dossier");
            }
            documentEntityList.add(documentEntityFound);
            while (documentEntityFound.getDossierparent()!=null && !documentEntityFound.getDossierparent().equals(rootFolder)){
                documentEntityFound = documentRepository.findById(documentEntityFound.getDossierparent());
                documentEntityList.add(documentEntityFound);
            }
        }
        DocumentEntity documentEntity = new DocumentEntity();
        documentEntity.setId(rootFolder);
        documentEntity.setNom("Lizbox");
        documentEntityList.add(documentEntity);
        Collections.reverse(documentEntityList);
        return documentEntityList;
    }

    /**
     * Méthode de téléchargement d'un document
     * @param id
     * @return
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws IOException
     * @throws RightException
     */
    @Transactional
    public DocumentDownloadFacade download(String id) throws ConnectUserException, DocumentException, IOException, RightException {
        DocumentEntity documentEntity = rightsBusiness.checkRight(id, DocumentsRights.RIGHT_DOWNLOAD);
        File file = getFile(documentEntity.getId());

        if(!file.exists()){
            throw new DocumentException("Error", "Fichier introuvable");
        }

        DocumentDownloadFacade documentDownloadFacade = new DocumentDownloadFacade();
        documentDownloadFacade.setId(documentEntity.getId());
        documentDownloadFacade.setName(documentEntity.getNom(), documentEntity.getExtension());

        //Content type
        documentDownloadFacade.setContentType(documentEntity.getTypefichier());

        //File
        documentDownloadFacade.setFile(convertToByteArray(file));

        return documentDownloadFacade;
    }

    private byte[] convertToByteArray(File file) throws IOException {
        //Convert to byte[]
        ByteArrayOutputStream ous = null;
        InputStream ios = null;
        byte[] buffer = new byte[4096];
        ous = new ByteArrayOutputStream();
        ios = new FileInputStream(file);
        int read = 0;
        while ( (read = ios.read(buffer)) != -1 ) {
            ous.write(buffer, 0, read);
        }
        ous.close();
        ios.close();
        return ous.toByteArray();
    }

    /**
     * Méthode d'upload d'un document
     * @param file
     * @param idDossierParent
     * @param appWeb
     * @throws IOException
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws UploadException
     * @throws RightException
     */
    @Transactional
    public void upload(MultipartFile file, String idDossierParent, boolean appWeb) throws IOException, ConnectUserException, DocumentException, UploadException, RightException {
        UtilisateurEntity user = connectUser.getConnectedUser();

        //Test fichier non null
        if (file.isEmpty()) {
            throw new UploadException("Error", "Une erreur de récupération de votre fichier s'est produite.");
        }

        //Test fichier déjà existant
        String fileName = FilenameUtils.getBaseName(file.getOriginalFilename());
        String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
        if(documentRepository.countByNomAndExtensionAndDossierparentAndUser(fileName, fileExtension, idDossierParent, user.getId()) > 0){
            throw new UploadException("Error", "Un fichier portant le même nom existe déjà dans ce dossier.");
        }

        long fileSize = file.getSize();

        //Test de taille du fichier
        checkSize(fileSize, appWeb, user);

        //Test dossierParent existe pas
        DocumentEntity dossier = rightsBusiness.checkRight(idDossierParent,DocumentsRights.RIGHT_TOUPLOADIN);

        DocumentEntity documentEntity = new DocumentEntity();
        documentEntity.setCreation(new Timestamp(new Date().getTime()));
        documentEntity.setDossierparent(dossier==null ? rootFolder : dossier.getId());
        documentEntity.setEstfichier(Byte.parseByte("1"));
        documentEntity.setExtension(fileExtension);
        documentEntity.setId(UUID.randomUUID().toString());
        documentEntity.setModification(new Timestamp(new Date().getTime()));
        documentEntity.setNom(fileName);
        documentEntity.setTypefichier(file.getContentType());
        documentEntity.setUser(user.getId());
        documentEntity.setPartagepublic((byte)0);
        documentEntity.setPartageprivee((byte)0);
        documentEntity.setTaille((int)file.getSize());

        OutputStream out = new FileOutputStream(getFile(documentEntity.getId()));

        InputStream filecontent = file.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }
        documentRepository.saveAndFlush(documentEntity);
        if (out != null) {
            out.close();
        }
    }

    /**
     * Méthode qui test l'upload maximal autorisé ET si l'utilisateur possède assez d'espace pour télécharger le fichier
     * @param fileSize
     * @param appWeb
     * @param user
     * @throws UploadException
     */
    private void checkSize(long fileSize, boolean appWeb, UtilisateurEntity user) throws UploadException {
        //Test de la taille d'upload maximmale autorisée
        if(appWeb){
            if(fileSize>maxUploadSizeWeb){
                throw new UploadException("Erreur", "Fichier trop volumineux. La taille maximale autorisée est de "+maxUploadSizeWeb/convertOToGo+" Go.");
            }
        }else{
            if(fileSize>maxUploadSizeApps){
                throw new UploadException("Erreur", "Fichier trop volumineux. La taille maximale autorisée est de "+maxUploadSizeApps/convertOToMo+" Mo pour les applications Lizbox.");
            }
        }
        //Test espace utilisateur
        long totalSpace = planRepository.findOne(user.getRole()).getEspace();
        long usedSpace = documentRepository.usedSpace(user.getId());
        if(usedSpace+fileSize>totalSpace){
            String errorMessage = new StringBuilder()
                    .append("Vous ne disposez plus d'assez d'espace disponible pour uploader ce fichier (Espace disponible : ")
                    .append((totalSpace-usedSpace)/convertOToMo)
                    .append(" Mo)")
                    .toString();
            throw new UploadException("Error",errorMessage);
        }
    }

    /**
     * Méthode permettant de récupèrer un fichier physique sur le serveur
     * @param id
     * @return
     * @throws IOException
     * @throws DocumentException
     */
    private File getFile(String id) throws IOException, DocumentException {
        if(!FileLibrary.getFile().exists()){
            throw new DocumentException("Error", "Erreur grave. Veuillez contacter l'administrateur du site.");
        }
        String path = new StringBuffer()
                .append(FileLibrary.getFile().getAbsolutePath())
                .append(File.separator)
                .append(id)
                .toString();
        return new File(path);
    }

    /*private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }*/

    /**
     * Ajouter à la liste de documents un dossier de retour au dossier précédent
     * @param idDossier
     * @return
     * @throws ConnectUserException
     */
    private DocumentEntity getReturnFolder(String idDossier) throws ConnectUserException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        DocumentEntity dossier = documentRepository.findById(idDossier);
        DocumentEntity dossierParent = null;
        String returnFolderName = null;

        if(dossier == null || dossier.getDossierparent() == null || dossier.getDossierparent().equals(rootFolder)){
            dossierParent = new DocumentEntity();
            dossierParent.setEstfichier((byte) 0);
            dossierParent.setId(rootFolder);
            dossierParent.setTaille(0);
            dossierParent.setUser(userRequest.getId());
            returnFolderName = new StringBuilder()
                    .append("Retourner à la racine")
                    .toString();
        }else{
            dossierParent = documentRepository.findById(dossier.getDossierparent());
            returnFolderName = new StringBuilder()
                    .append("Retourner à ")
                    .append(dossierParent.getNom())
                    .toString();
        }
        dossierParent.setNom(returnFolderName);
        return dossierParent;
    }

    /**
     * Récupèrer un document avec son id
     * @param id
     * @return
     */
    public DocumentEntity getDocument(String id){
        return documentRepository.findById(id);
    }

    /**
     * Récupèrer le dossier de partage VIRTUEL à insèrer à la racine de l'arborescence de l'utilisateur
     * @return
     * @throws ConnectUserException
     */
    public DocumentEntity getShareFolder() throws ConnectUserException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        DocumentEntity shareFolder = new DocumentEntity();
        shareFolder.setNom(shareFolderName);
        shareFolder.setUser(userRequest.getId());
        shareFolder.setTaille(0);
        shareFolder.setEstfichier((byte) 0);
        shareFolder.setCreation(null);
        shareFolder.setModification(null);
        shareFolder.setDossierparent(rootFolder);
        shareFolder.setPartageprivee((byte) 0);
        shareFolder.setPartagepublic((byte) 0);
        shareFolder.setExtension("");
        shareFolder.setTypefichier("dossier");
        shareFolder.setId(shareFolderId);
        return shareFolder;
    }

    /**
     * Récupèrer mes documents partagés (ensemble des fichiers que l'on m'a partagé) à insèrer dans le dossier de partages privés
     * @return
     * @throws ConnectUserException
     */
    public List<DocumentEntity> getDocumentSharedToMe() throws ConnectUserException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        List<PartageEntity> partageEntities = partageRepository.findAllByRecepteur(userRequest);
        List<DocumentEntity> sharedDocuments = new ArrayList<DocumentEntity>();
        sharedDocuments.add(this.getReturnFolder(rootFolder));
        for(PartageEntity partage : partageEntities){
            DocumentEntity documentEntity = documentRepository.findById(partage.getDocument());
            documentEntity.setDossierparent(shareFolderId);
            sharedDocuments.add(documentEntity);
        }

        return sharedDocuments;
    }
}
