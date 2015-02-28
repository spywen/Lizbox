package com.apilizbox.business;


import com.apilizbox.entity.DocumentEntity;
import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.exception.InscriptionException;
import com.apilizbox.repository.DocumentRepository;
import com.apilizbox.repository.UtilisateurRepository;
import com.apilizbox.utils.ConnectUser;
import com.apilizbox.utils.Notifications;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Laurent on 06/01/14.
 */
@Service
public class UtilisateurBusiness {
    @Autowired
    UtilisateurRepository utilisateurRepository;
    @Autowired
    DocumentRepository documentRepository;
    @Autowired
    NotificationBusiness notificationBusiness;
    @Autowired
    ConnectUser connectUser;

    /**
     * Récupèrer la liste de tous les utilisateurs
     * @return
     */
    public List<UtilisateurEntity> findAll(){
        return utilisateurRepository.findAll();
    }

    /**
     * Retourne un utilisateur via son id
     * @param id
     * @return
     * @throws ConnectUserException
     */
    public UtilisateurEntity findOne(int id) throws ConnectUserException {
        UtilisateurEntity user = connectUser.getConnectedUser();
        if(user.getId() == id){
            return utilisateurRepository.findOne(id);
        }
        return null;
    }

    /**
     * Méthode d'inscription d'un utilisateur
     * @param utilisateurEntity
     * @return
     * @throws InscriptionException
     */
    public UtilisateurEntity save(UtilisateurEntity utilisateurEntity) throws InscriptionException {
        if(!pseudoFree(utilisateurEntity.getPseudo())){
            throw new InscriptionException("Error", "Pseudo déjà utilisé.");
        }
        if(!emailFree(utilisateurEntity.getEmail())){
            throw new InscriptionException("Error", "Email déjà utilisé.");
        }
        //Timestamps convert
        utilisateurEntity.setInscription(new Timestamp(utilisateurEntity.getInscription().getTime() * 1000));
        //ROLE
        utilisateurEntity.setRole("ROLE_FREE");
        //Password encrypt
        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        utilisateurEntity.setPassword(encoder.encodePassword(utilisateurEntity.getPassword(),null));
        UtilisateurEntity newUser = utilisateurRepository.save(utilisateurEntity);
        //Creation du dossier par défaut
        this.createWelcomeFiles(newUser.getId());
        notificationBusiness.create(Notifications.NotificationWelcome.type, newUser.getId(), 0, "");
        return newUser;
    }

    /**
     * Suppression d'un utilisateur
     * @param id
     */
    public void delete(int id){
        utilisateurRepository.delete(id);
    }

    /**
     * Méthode de connexion pour les plateformes autre que web
     * @param utilisateurEntity
     * @return
     */
    public Integer login(UtilisateurEntity utilisateurEntity){
        return utilisateurRepository.login(utilisateurEntity.getPseudo(), utilisateurEntity.getPassword());
    }

    /**
     * Renvoie true si un pseudo n'est pas déjà utilisé
     * @param pseudo
     * @return
     */
    public boolean pseudoFree(String pseudo){
        if(utilisateurRepository.countByPseudo(pseudo)>0)
            return false;
        return true;
    }

    /**
     * Renvoie true si un email n'est pas déjà utilisé
     * @param email
     * @return
     */
    public boolean emailFree(String email){
        if(utilisateurRepository.countByEmail(email)>0)
            return false;
        return true;
    }

    /**
     * Création des documents par défaut
     * - Un dossier par défaut du nom de "Mon premier dossier"
     * @param userId
     */
    public void createWelcomeFiles(int userId){
        if(userId!=0){
            DocumentEntity welcomeFolder = new DocumentEntity();
            welcomeFolder.setNom("Mon premier dossier");
            welcomeFolder.setUser(userId);
            welcomeFolder.setTaille(0);
            welcomeFolder.setEstfichier((byte) 0);
            welcomeFolder.setCreation(new Timestamp(new Date().getTime()));
            welcomeFolder.setModification(new Timestamp(new Date().getTime()));
            welcomeFolder.setDossierparent("0");
            welcomeFolder.setPartageprivee((byte) 0);
            welcomeFolder.setPartagepublic((byte) 0);
            welcomeFolder.setExtension("");
            welcomeFolder.setTypefichier("dossier");
            welcomeFolder.setId(UUID.randomUUID().toString());
            documentRepository.save(welcomeFolder);
        }
    }
}
