package com.apilizbox.business;

import com.apilizbox.entity.PlanEntity;
import com.apilizbox.entity.SouscriptionEntity;
import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.repository.*;
import com.apilizbox.utils.ConnectUser;
import com.apilizbox.utils.statistiques.DocumentsStatistiquesFacade;
import com.apilizbox.utils.statistiques.PartagesStatistiquesFacade;
import com.apilizbox.utils.statistiques.StatistiquesFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by laurent on 29/05/2014.
 */
@Service
public class StatistiqueBusiness {
    @Autowired
    DocumentRepository documentRepository;
    @Autowired
    UtilisateurRepository utilisateurRepository;
    @Autowired
    PartageRepository partageRepository;
    @Autowired
    NotificationBusiness notificationBusiness;
    @Autowired
    PlanRepository planRepository;
    @Autowired
    SouscriptionRepository souscriptionRepository;
    @Autowired
    ConnectUser connectUser;

    /**
     * Méthode permettant de récupèrer toutes les statistiques relative à l'utilisateur connecté
     * @return
     * @throws ConnectUserException
     */
    @Transactional
    public StatistiquesFacade getStatistiques() throws ConnectUserException {
        UtilisateurEntity userRequest = connectUser.getConnectedUser();
        StatistiquesFacade statistiquesFacade = new StatistiquesFacade();

        ////Données Utilisateur
        statistiquesFacade.setUtilisateurEntity(getUtilisateur(userRequest));
        ////Données Soucription
        statistiquesFacade.setSouscription(getSouscription(userRequest));
        ////Données Plan
        statistiquesFacade.setPlanEntity(getPlan(userRequest));
        ////Données Documents
        statistiquesFacade.setDocumentsStatistiques(getDocumentsStats(userRequest));
        ////Données Partages
        statistiquesFacade.setPartageStatistiques(getPartagesStats(userRequest));

        return statistiquesFacade;
    }

    /**
     * Récupère le profil de l'utilisateur
     * @param user
     * @return
     */
    private UtilisateurEntity getUtilisateur(UtilisateurEntity user){
        return user;
    }

    private SouscriptionEntity getSouscription(UtilisateurEntity user){
        return null;
    }

    /**
     * Récupère l'offre (plan) de l'utilisateur
     * @param user
     * @return
     */
    private PlanEntity getPlan(UtilisateurEntity user){
        return planRepository.findOne(user.getRole());
    }

    /**
     * Récupère les stats de documents relatives à un utilisateur
     * @param user
     * @return
     */
    private DocumentsStatistiquesFacade getDocumentsStats(UtilisateurEntity user){
        long totalSpace = planRepository.findOne(user.getRole()).getEspace();
        long usedSpace = documentRepository.usedSpace(user.getId());
        DocumentsStatistiquesFacade documentsStatistiquesFacade = new DocumentsStatistiquesFacade();
        documentsStatistiquesFacade.setEspaceTotal(totalSpace);
        documentsStatistiquesFacade.setEspaceUtilise(usedSpace);
        try{
            documentsStatistiquesFacade.setPourcentageEspaceUtilise((usedSpace*100)/totalSpace);
        }catch (Exception e){
            documentsStatistiquesFacade.setPourcentageEspaceUtilise(0);
        }
        documentsStatistiquesFacade.setNbrFichiers(documentRepository.countFileAndFolder(user.getId(),true));
        documentsStatistiquesFacade.setNbrDossiers(documentRepository.countFileAndFolder(user.getId(),false));
        return documentsStatistiquesFacade;
    }

    /**
     * Récupère les stats relatives aux partages d'un utilisateur
     * @param user
     * @return
     */
    private PartagesStatistiquesFacade getPartagesStats(UtilisateurEntity user){
        long partagePrivee = partageRepository.countPrivateShare(user.getId());
        long partagePublic = documentRepository.countPublicShare(user.getId(),true);
        long partageAMoi = partageRepository.countShareToMe(user.getId());
        PartagesStatistiquesFacade partagesStatistiquesFacade = new PartagesStatistiquesFacade();
        partagesStatistiquesFacade.setNbrPartageTotal(partagePrivee + partagePublic);
        partagesStatistiquesFacade.setNbrPartagePrivee(partagePrivee);
        partagesStatistiquesFacade.setNbrPartageAMoi(partageAMoi);
        partagesStatistiquesFacade.setNbrPartagePublic(partagePublic);
        return partagesStatistiquesFacade;
    }

}
