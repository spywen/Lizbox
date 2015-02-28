package com.apilizbox.business;

import com.apilizbox.entity.DocumentEntity;
import com.apilizbox.entity.PartageEntity;
import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.exception.DocumentException;
import com.apilizbox.exception.RightException;
import com.apilizbox.repository.DocumentRepository;
import com.apilizbox.repository.PartageRepository;
import com.apilizbox.utils.ConnectUser;
import com.apilizbox.utils.DocumentsRights;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by laurent on 30/05/2014.
 */
@Service
public class RightsBusiness {
    @Autowired
    DocumentRepository documentRepository;
    @Autowired
    PartageRepository partageRepository;
    @Autowired
    ConnectUser connectUser;

    /**
     * Id du dossier root pour n'importe quel utilisateur (son dossier racine, VIRTUEL)
     */
    private String idRootFolder = "0";
    /**
     * Id du dossier de partage pour n'importe quel utilisateur (VIRTUEL)
     */
    private String idShareFolder = "shareFolderId";

    /**
     * Méthode qui vérifie les droits sur les documents
     * @param idDocument
     * @param documentRightAsking
     * @return
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws RightException
     */
    public DocumentEntity checkRight(String idDocument, String documentRightAsking) throws ConnectUserException, DocumentException, RightException {

        //Cas particulier du download
        if(documentRightAsking.equals(DocumentsRights.RIGHT_DOWNLOAD)){
            return checkRightToDownload(idDocument);
        }

        //Init
        DocumentEntity documentEntity = null;
        UtilisateurEntity userRequest = connectUser.getConnectedUser();


        //M'appartient
        if(documentRightAsking.equals(DocumentsRights.RIGHT_BELONGTOME)){
            documentEntity = documentRepository.findById(idDocument);
            if(documentEntity.getUser() != userRequest.getId()){
                thrownException("Action impossible car ce fichier ne vous appartient pas.");
            }
        }

        //Cas particuliers
        if(idDocument.equals(idRootFolder)
                && !documentRightAsking.equals(DocumentsRights.RIGHT_TOMOVEIN)
                && !documentRightAsking.equals(DocumentsRights.RIGHT_TOUPLOADIN)
                && !documentRightAsking.equals(DocumentsRights.RIGHT_GETFORARBO)){
            thrownException("Action impossible sur le dossier racine.");
        }else if(idDocument.equals(idShareFolder)
                && !documentRightAsking.equals(DocumentsRights.RIGHT_GETFORARBO)){
            thrownException("Action impossible sur le dossier de partage privé.");
        }else {
            documentEntity = documentRepository.findById(idDocument);
        }

        //Test si le document existe bien
        if(documentEntity != null ){
            if(documentEntity.getEstfichier()==(byte)1){
                //FICHIER
                if(documentRightAsking.equals(DocumentsRights.RIGHT_EDIT)){
                    if(documentEntity.getUser() != userRequest.getId()){
                        thrownException("Droits insuffisants pour éditer ce fichier.");
                    }
                }else if(documentRightAsking.equals(DocumentsRights.RIGHT_MOVE)){
                    if(documentEntity.getUser() != userRequest.getId()){
                        thrownException("Droits insuffisants pour changer l'emplacement de ce fichier.");
                    }
                }else if(documentRightAsking.equals(DocumentsRights.RIGHT_REMOVE)){
                    //Cas : appartient à l'utilisateur connecté
                    if(documentEntity.getUser() == userRequest.getId()){ }
                    //Cas : partage privé avec autorisation d'écriture
                    else if(partageRepository.countByRecepteurAndDocument(userRequest, documentEntity.getId())>0)
                    {
                        PartageEntity partageEntity = partageRepository.findAllByRecepteurAndDocument(userRequest,documentEntity.getId());
                        if(partageEntity.getEcriture()==(byte)0){
                            thrownException("Vous n'avez pas les droits  ce fichier.");
                        }
                    }
                    else{
                        thrownException("Droits insuffisants pour effacer ce fichier.");
                    }
                }else if(documentRightAsking.equals(DocumentsRights.RIGHT_SHARE)){
                    if(documentEntity.getUser() != userRequest.getId()){
                        thrownException("Droits insuffisants pour partager ce fichier.");
                    }
                }else if(documentRightAsking.equals(DocumentsRights.RIGHT_TOMOVEIN)){
                    thrownException("Impossible de déplacer un document dans un fichier.");
                }else if(documentRightAsking.equals(DocumentsRights.RIGHT_TOUPLOADIN)){
                    thrownException("Impossible de déplacer un fichier dans un autre.");
                }else if(documentRightAsking.equals(DocumentsRights.RIGHT_GETFORARBO)){
                    thrownException("Une erreur s'est produite. Si le problème persiste veuillez contacter l'administrateur.");
                }
            }else{
                //DOSSIER
                if(documentRightAsking.equals(DocumentsRights.RIGHT_EDIT)){
                    if(documentEntity.getUser() != userRequest.getId()){
                        thrownException("Droits insuffisants pour éditer ce fichier.");
                    }
                }else if(documentRightAsking.equals(DocumentsRights.RIGHT_MOVE)){
                    if(documentEntity.getUser() != userRequest.getId()){
                        thrownException("Droits insuffisants pour changer l'emplacement de ce dossier.");
                    }
                }else if(documentRightAsking.equals(DocumentsRights.RIGHT_REMOVE)){
                    if(documentEntity.getUser() != userRequest.getId()){
                        thrownException("Droits insuffisants pour supprimer ce dossier.");
                    }
                }else if(documentRightAsking.equals(DocumentsRights.RIGHT_SHARE)){
                    thrownException("Un dossier ne peut pas être partagé.");
                }else if(documentRightAsking.equals(DocumentsRights.RIGHT_TOMOVEIN)){ }
                else if(documentRightAsking.equals(DocumentsRights.RIGHT_GETFORARBO)){
                    if(documentEntity.getUser() != userRequest.getId()){
                        thrownException("Impossible de récupèrer le dossier pour afficher l'arborescence.");
                    }
                }
            }
        }else{
            //Cas upload dans dossier root
            if(idDocument.equals(idRootFolder) && documentRightAsking.equals(DocumentsRights.RIGHT_TOUPLOADIN)){
                return null;
            }
            //Cas d'un move dans dossier root
            else if(idDocument.equals(idRootFolder) && documentRightAsking.equals(DocumentsRights.RIGHT_TOMOVEIN)){
                return null;
            }
            else{
                thrownException("Une erreur s'est produite pendant la récupération du fichier.");
            }
        }
        return documentEntity;
    }

    /**
     * Méthode relative au cas particulier (relativement complexe) du download
     * @param idDocument
     * @return
     * @throws ConnectUserException
     * @throws RightException
     */
    private DocumentEntity checkRightToDownload(String idDocument) throws ConnectUserException, RightException {
        DocumentEntity documentEntity = documentRepository.findById(idDocument);
        UtilisateurEntity userRequest = null;
        try{
            userRequest = connectUser.getConnectedUser();
        }catch (Exception e){
            userRequest = null;
        }

        if(documentEntity != null){
            if(documentEntity.getEstfichier()==(byte)1){
                if(userRequest==null){
                    if(documentEntity.getPartagepublic() == (byte)1){ }
                }else{
                    //Cas : partage public, tous le monde peut télécharger le fichier
                    if(documentEntity.getPartagepublic() == (byte)1){ }
                    //Cas : appartient à l'utilisateur connecté
                    else if(userRequest != null && documentEntity.getUser() == userRequest.getId()){ }
                    //Cas : partage privé
                    else if(userRequest!= null && partageRepository.countByRecepteurAndDocument(userRequest,documentEntity.getId())>0){ }
                    else{
                        thrownException("Droits insuffisants pour télécharger ce fichier.");
                    }
                }
            }else{
                thrownException("Un dossier ne peut pas être téléchargé.");
            }
        }else{
            thrownException("Une erreur s'est produite pendant la récupération du fichier.");
        }
        return documentEntity;
    }

    /**
     * Méthode qui throw une exception relative aux droits
     * @param message
     * @throws RightException
     */
    private void thrownException(String message) throws RightException {
            throw new RightException("Right",message);
    }
}
