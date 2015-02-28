package com.apilizbox.utils.statistiques;

/**
 * Created by laurent on 29/05/2014.
 * Facade relative au statistiques des documents d'un utilisateur
 */
public class DocumentsStatistiquesFacade {
    private long pourcentageEspaceUtilise;
    private long espaceUtilise;
    private long espaceTotal;
    private long nbrFichiers;
    private long nbrDossiers;

    public long getPourcentageEspaceUtilise() {
        return pourcentageEspaceUtilise;
    }

    public void setPourcentageEspaceUtilise(long pourcentageEspaceUtilise) {
        this.pourcentageEspaceUtilise = pourcentageEspaceUtilise;
    }

    public long getEspaceUtilise() {
        return espaceUtilise;
    }

    public void setEspaceUtilise(long espaceUtilise) {
        this.espaceUtilise = espaceUtilise;
    }

    public long getEspaceTotal() {
        return espaceTotal;
    }

    public void setEspaceTotal(long espaceTotal) {
        this.espaceTotal = espaceTotal;
    }

    public long getNbrFichiers() {
        return nbrFichiers;
    }

    public void setNbrFichiers(long nbrFichiers) {
        this.nbrFichiers = nbrFichiers;
    }

    public long getNbrDossiers() {
        return nbrDossiers;
    }

    public void setNbrDossiers(long nbrDossiers) {
        this.nbrDossiers = nbrDossiers;
    }
}
