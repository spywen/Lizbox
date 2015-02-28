package com.apilizbox.business;

import com.apilizbox.entity.DocumentEntity;
import com.apilizbox.entity.PartageEntity;
import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.exception.DocumentException;
import com.apilizbox.exception.PartageException;
import com.apilizbox.exception.RightException;
import com.apilizbox.repository.DocumentRepository;
import com.apilizbox.repository.PartageRepository;
import com.apilizbox.repository.UtilisateurRepository;
import com.apilizbox.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by laurent on 11/05/2014.
 */
@Service
public class PartageBusiness {
    @Autowired
    DocumentRepository documentRepository;
    @Autowired
    DocumentBusiness documentBusiness;
    @Autowired
    PartageRepository partageRepository;
    @Autowired
    UtilisateurRepository utilisateurRepository;
    @Autowired
    NotificationBusiness notificationBusiness;
    @Autowired
    RightsBusiness rightsBusiness;

    @Autowired
    ConnectUser connectUser;

    //PARTAGE PUBLIC
    private String publicSharePageLink = "/share/public/";
    private String publicShareDownloadLink = "/share/public/download/";

    /**
     * Récupèrer le status de partage public d'un document
     * @param id
     * @param request
     * @return
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws RightException
     */
    @Transactional
    public PublicShareFacade getPublicShareLink(String id, HttpServletRequest request) throws ConnectUserException, DocumentException, RightException {
        DocumentEntity documentEntity = rightsBusiness.checkRight(id, DocumentsRights.RIGHT_BELONGTOME);
        PublicShareFacade publicShareFacade = new PublicShareFacade();
        publicShareFacade.setIdDocument(documentEntity.getId());
        publicShareFacade.setIsPublicShare(isPublicShare(id));
        publicShareFacade.setPublicShareLink(new StringBuilder().append(ContextPath.getURLWithContextPath(request)).append(publicSharePageLink).append(documentEntity.getId()).toString());
        return publicShareFacade;
    }

    /**
     * Récupèrer les informations nécessaires d'un partage pour la création de la page de partage public
     * @param id
     * @param request
     * @return
     * @throws ConnectUserException
     * @throws DocumentException
     */
    @Transactional
    public PublicSharePageFacade getPublicSharePageObject(String id, HttpServletRequest request) throws ConnectUserException, DocumentException {
        DocumentEntity documentEntity = documentBusiness.getDocument(id);
        PublicSharePageFacade publicSharePageFacade = new PublicSharePageFacade();
        publicSharePageFacade.setDocument(documentEntity);
        publicSharePageFacade.setDownloadLink(new StringBuilder().append(ContextPath.getURLWithContextPath(request)).append(publicShareDownloadLink).append(documentEntity.getId()).toString());
        return publicSharePageFacade;
    }

    /**
     * Méthode qui permet l'activation ou non du partage public
     * @param id
     * @param isActive
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws RightException
     */
    @Transactional
    public void activePublicShare(String id, String isActive) throws ConnectUserException, DocumentException, RightException {
        DocumentEntity documentEntity = rightsBusiness.checkRight(id,DocumentsRights.RIGHT_BELONGTOME);
        documentEntity.setPartagepublic(isActive.equals("1") ? (byte)1 : (byte)0);
        documentRepository.save(documentEntity);
    }

    /**
     * Retourne true si un document est partagé publiquement
     * @param id
     * @return
     * @throws DocumentException
     * @throws ConnectUserException
     */
    @Transactional
    public Boolean isPublicShare(String id) throws DocumentException, ConnectUserException {
        DocumentEntity documentEntity = documentRepository.findById(id);
        if( documentEntity.getPartagepublic() != null && documentEntity.getPartagepublic()==1){
            return true;
        }else{
            return false;
        }
    }

    //PARTAGE PRIVEE

    /**
     * Méthode d'activation d'un partage privé sur un document
     * @param id
     * @param isActive
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws RightException
     */
    public void activePrivateShare(String id, String isActive) throws ConnectUserException, DocumentException, RightException {
        DocumentEntity documentEntity = rightsBusiness.checkRight(id,DocumentsRights.RIGHT_BELONGTOME);
        documentEntity.setPartageprivee(isActive.equals("1") ? (byte)1 : (byte)0);
        documentRepository.save(documentEntity);
    }

    /**
     * Récupération de la liste des partages privés d'un document
     * @param documentId
     * @return
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws RightException
     */
    public List<PartageEntity> getPrivateShare(String documentId) throws ConnectUserException, DocumentException, RightException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        DocumentEntity documentEntity = rightsBusiness.checkRight(documentId, DocumentsRights.RIGHT_BELONGTOME);
        List<PartageEntity> partageEntities = partageRepository.findAllByEmeteurAndDocument(userRequest,documentEntity.getId());
        return partageEntities;
    }

    /**
     * Création d'un partage privé à partir d'un email ou d'un pseudo d'un utilisateur
     * @param idDocument
     * @param recepteurLabel
     * @return
     * @throws ConnectUserException
     * @throws PartageException
     * @throws RightException
     * @throws DocumentException
     */
    public PartageEntity createPrivateShare(String idDocument, String recepteurLabel) throws ConnectUserException, PartageException, RightException, DocumentException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        DocumentEntity document = rightsBusiness.checkRight(idDocument,DocumentsRights.RIGHT_SHARE);

        UtilisateurEntity recepteur = utilisateurRepository.findByEmail(recepteurLabel);

        //Vérification que le document n'est pas un dossier
        if(document.getEstfichier()==(byte)0){
            throw new PartageException("warning","Partage d'un dossier impossible.");
        }
        //Test de recherche de l'utilisateur avec qui partager
        if(recepteur==null){
            recepteur = utilisateurRepository.findByPseudo(recepteurLabel);
            if(recepteur==null){
                throw new PartageException("warning","Aucun utilisateur avec le pseudo ou l'email spécifié.");
            }
        }
        //Test de vérification de non auto partage
        if(recepteur.getId()==userRequest.getId()){
            throw new PartageException("warning","Impossible de s'auto partager un fichier.");
        }
        //Test de vérification de non "REpartage"
        if(partageRepository.countByRecepteurAndDocument(recepteur,idDocument)!=0){
            throw new PartageException("warning","Ce document est déjà partagé avec cette personne.");
        }
        PartageEntity partageEntity = new PartageEntity();
        partageEntity.setAccepte((byte)0);
        partageEntity.setDebut(new Timestamp(new Date().getTime()));
        partageEntity.setDocument(idDocument);
        partageEntity.setEcriture((byte)0);
        partageEntity.setEmeteur(userRequest);
        partageEntity.setRecepteur(recepteur);

        DocumentEntity documentEntity = documentRepository.findById(partageEntity.getDocument());
        documentEntity.setPartageprivee((byte)1);
        documentRepository.save(documentEntity);

        notificationBusiness.create(Notifications.NotificationShare.type,partageEntity.getRecepteur().getId(), userRequest.getId(), partageEntity.getDocument());

        return partageRepository.save(partageEntity);
    }

    /**
     * Gestion des droits du partage privé (Droit d'écriture ou non)
     * @param idPartage
     * @param haveWriteRight
     */
    public void update(int idPartage, String haveWriteRight){
        PartageEntity partageEntity = partageRepository.findOne(idPartage);
        if(haveWriteRight.equals("1")){
            partageEntity.setEcriture((byte)1);
        }else{
            partageEntity.setEcriture((byte)0);
        }
        partageRepository.save(partageEntity);
    }

    /**
     * Suppression d'un partage privé
     * @param id
     * @throws ConnectUserException
     * @throws PartageException
     */
    public void deleteShare(int id) throws ConnectUserException, PartageException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        PartageEntity partageEntity = partageRepository.findOne(id);
        String idDocument = partageEntity.getDocument();
        if(partageEntity.getEmeteur().getId()!=userRequest.getId())
            throw  new PartageException("Error", "Vous n'avez pas les droits pour supprimer ce partage");

        partageRepository.delete(partageEntity);
        notificationBusiness.create(Notifications.NotificationRemoveShare.type,partageEntity.getRecepteur().getId(), userRequest.getId(), idDocument);
        if(partageRepository.countByDocument(idDocument)==0){
            //Partage privé désactivé
            DocumentEntity documentEntity = documentRepository.findById(idDocument);
            documentEntity.setPartageprivee((byte)0);
            documentRepository.save(documentEntity);
        }
    }
}
