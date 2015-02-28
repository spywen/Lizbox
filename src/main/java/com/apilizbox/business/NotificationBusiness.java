package com.apilizbox.business;

import com.apilizbox.entity.DocumentEntity;
import com.apilizbox.entity.NotificationEntity;
import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.repository.DocumentRepository;
import com.apilizbox.repository.NotificationRepository;
import com.apilizbox.repository.UtilisateurRepository;
import com.apilizbox.utils.ConnectUser;
import com.apilizbox.utils.NotificationFacade;
import com.apilizbox.utils.Notifications;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by laurent on 15/02/2014.
 */
@Service
public class NotificationBusiness {
    @Autowired
    NotificationRepository notificationRepository;
    @Autowired
    DocumentRepository documentRepository;
    @Autowired
    UtilisateurRepository utilisateurRepository;
    @Autowired
    ConnectUser connectUser;

    /**
     * Retourne toutes les notifications d'un utilisateur (lues/non lues)
     * @param count
     * @return
     * @throws ConnectUserException
     */
    public List<NotificationFacade> findAllByUser(int count) throws ConnectUserException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        List<NotificationEntity>  notificationEntities = null;
        if(count==0)
            notificationEntities = notificationRepository.findByUtilisateurOrderByDateDesc(userRequest.getId());
        else{
            Pageable limit = new PageRequest(0, count);
            notificationEntities = notificationRepository.findByUtilisateurOrderByDateDesc(userRequest.getId(),limit);
        }
        return this.convertToFacade(notificationEntities, userRequest);
    }

    /**
     * Retourne toutes les notifications non lues d'un utilisateur
     * (limité éventuellement à un certain nombre si count != 0)
     * @param count
     * @return
     * @throws ConnectUserException
     */
    public List<NotificationFacade> findAllByUserNoRead(int count) throws ConnectUserException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        List<NotificationEntity>  notificationEntities = null;
        if(count==0)
            notificationEntities= notificationRepository.findByUtilisateurAndLectureIsNullOrderByDateDesc(userRequest.getId());
        else{
            Pageable limit = new PageRequest(0, count);
            notificationEntities= notificationRepository.findByUtilisateurAndLectureIsNullOrderByDateDesc(userRequest.getId(),limit);
        }
        return this.convertToFacade(notificationEntities, userRequest);
    }

    /**
     * Retourne toutes les notifications lues par l'utilisateur (limité si count != 0)
     * @param count
     * @return
     * @throws ConnectUserException
     */
    public List<NotificationFacade> findAllByUserRead(int count) throws ConnectUserException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        List<NotificationEntity>  notificationEntities = null;
        if(count==0)
            notificationEntities= notificationRepository.findByUtilisateurAndLectureIsNotNullOrderByDateDesc(userRequest.getId());
        else{
            Pageable limit = new PageRequest(0, count);
            notificationEntities= notificationRepository.findByUtilisateurAndLectureIsNotNullOrderByDateDesc(userRequest.getId(), limit);
        }
        return this.convertToFacade(notificationEntities, userRequest);
    }

    /**
     * Permet d'indiquer la lecture d'une notification
     * @param id
     * @throws ConnectUserException
     */
    public void setNotificationLikeRead(int id) throws ConnectUserException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        NotificationEntity notificationEntity = notificationRepository.findOne(id);
        if(notificationEntity.getUtilisateur()==userRequest.getId()){
            notificationEntity.setLecture(new Timestamp(new Date().getTime()));
            notificationRepository.saveAndFlush(notificationEntity);
        }
    }

    /**
     * Permet d'indiquer la lecture de toutes les notifications d'un utilisateur
     * @throws ConnectUserException
     */
    public void setAllNotificationsAsRead() throws ConnectUserException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        List<NotificationEntity> notificationEntityList = notificationRepository.findByUtilisateurOrderByDateDesc(userRequest.getId());
        for(NotificationEntity notificationEntity : notificationEntityList){
            notificationEntity.setLecture(new Timestamp(new Date().getTime()));
            notificationRepository.saveAndFlush(notificationEntity);
        }
    }

    /**
     * Conversion des notifications en une liste de facades plus adaptées côté client
     * @param notificationEntities
     * @param userRequest
     * @return
     */
    private List<NotificationFacade> convertToFacade(List<NotificationEntity> notificationEntities, UtilisateurEntity userRequest){
        List<NotificationFacade> notificationFacades = new ArrayList<NotificationFacade>();
        for(NotificationEntity notificationEntity : notificationEntities){
            NotificationFacade notificationFacade = new NotificationFacade();

            notificationFacade.setId(notificationEntity.getId());

            notificationFacade.setTitre(notificationEntity.getTitre());
            notificationFacade.setMessage(notificationEntity.getMessage());

            notificationFacade.setDate(notificationEntity.getDate());
            notificationFacade.setType(notificationEntity.getType());
            if(notificationEntity.getLecture() != null){
                notificationFacade.setLu(true);
            }
            notificationFacades.add(notificationFacade);
        }
        return  notificationFacades;
    }

    /**
     * Méthode de création d'une notification
     * @param type
     * @param idTargetUser
     * @param idCoupable
     * @param idDocument
     */
    public void create(String type, int idTargetUser, int idCoupable, String idDocument){

        UtilisateurEntity coupable = utilisateurRepository.findOne(idCoupable);

        NotificationEntity notificationEntity = new NotificationEntity();
        notificationEntity.setDate(new Timestamp(new Date().getTime()));
        notificationEntity.setType(type);
        notificationEntity.setUtilisateur(idTargetUser);

        if(type.equals(Notifications.NotificationWelcome.type)){
            notificationEntity.setTitre(Notifications.NotificationWelcome.title);
            notificationEntity.setMessage(Notifications.NotificationWelcome.message);
        }else if(notificationEntity.getType().equals(Notifications.NotificationShare.type)){
            DocumentEntity documentEntity = documentRepository.findOne(idDocument);
            String documentName = documentEntity.getNom() + "." + documentEntity.getExtension();
            notificationEntity.setTitre(String.format(Notifications.NotificationShare.title, coupable.getPseudo()));
            notificationEntity.setMessage(String.format(Notifications.NotificationShare.message, documentName));
        }else if(notificationEntity.getType().equals(Notifications.NotificationRemoveShare.type)){
            DocumentEntity documentEntity = documentRepository.findOne(idDocument);
            String documentName = documentEntity.getNom() + "." + documentEntity.getExtension();
            notificationEntity.setTitre(String.format(Notifications.NotificationRemoveShare.title, coupable.getPseudo()));
            notificationEntity.setMessage(String.format(Notifications.NotificationRemoveShare.message, documentName));
        }else if(notificationEntity.getType().equals(Notifications.NotificationRemoveFileShared.type)){
            DocumentEntity documentEntity = documentRepository.findOne(idDocument);
            String documentName = documentEntity.getNom() + "." + documentEntity.getExtension();
            notificationEntity.setTitre(String.format(Notifications.NotificationRemoveFileShared.title, coupable.getPseudo()));
            notificationEntity.setMessage(String.format(Notifications.NotificationRemoveFileShared.message, documentName));
        }

        notificationRepository.save(notificationEntity);
    }



}
