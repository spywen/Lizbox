package com.apilizbox.utils.statistiques;

import com.apilizbox.entity.PlanEntity;
import com.apilizbox.entity.SouscriptionEntity;
import com.apilizbox.entity.UtilisateurEntity;

/**
 * Created by laurent on 29/05/2014.
 * Facade relative aux statistiques d'un utilisateur
 */
public class StatistiquesFacade {
    private UtilisateurEntity utilisateurEntity;
    private SouscriptionEntity souscription;
    private PlanEntity planEntity;
    private DocumentsStatistiquesFacade documentsStatistiquesFacade;
    private PartagesStatistiquesFacade partageStatistiques;

    public UtilisateurEntity getUtilisateurEntity() {
        return utilisateurEntity;
    }

    public void setUtilisateurEntity(UtilisateurEntity utilisateurEntity) {
        this.utilisateurEntity = utilisateurEntity;
    }

    public SouscriptionEntity getSouscription() {
        return souscription;
    }

    public void setSouscription(SouscriptionEntity souscription) {
        this.souscription = souscription;
    }

    public PlanEntity getPlanEntity() {
        return planEntity;
    }

    public void setPlanEntity(PlanEntity planEntity) {
        this.planEntity = planEntity;
    }

    public DocumentsStatistiquesFacade getDocumentsStatistiques() {
        return documentsStatistiquesFacade;
    }

    public void setDocumentsStatistiques(DocumentsStatistiquesFacade documentsStatistiquesFacade) {
        this.documentsStatistiquesFacade = documentsStatistiquesFacade;
    }

    public PartagesStatistiquesFacade getPartageStatistiques() {
        return partageStatistiques;
    }

    public void setPartageStatistiques(PartagesStatistiquesFacade partageStatistiques) {
        this.partageStatistiques = partageStatistiques;
    }
}
