package com.apilizbox.utils.statistiques;

/**
 * Created by laurent on 29/05/2014.
 * Facade relative aux statistiques de partage d'un utilisateur
 */
public class PartagesStatistiquesFacade {
    private long nbrPartageTotal;
    private long nbrPartagePublic;
    private long nbrPartagePrivee;
    private long nbrPartageAMoi;

    public long getNbrPartageTotal() {
        return nbrPartageTotal;
    }

    public void setNbrPartageTotal(long nbrPartageTotal) {
        this.nbrPartageTotal = nbrPartageTotal;
    }

    public long getNbrPartagePublic() {
        return nbrPartagePublic;
    }

    public void setNbrPartagePublic(long nbrPartagePublic) {
        this.nbrPartagePublic = nbrPartagePublic;
    }

    public long getNbrPartagePrivee() {
        return nbrPartagePrivee;
    }

    public void setNbrPartagePrivee(long nbrPartagePrivee) {
        this.nbrPartagePrivee = nbrPartagePrivee;
    }

    public long getNbrPartageAMoi() {
        return nbrPartageAMoi;
    }

    public void setNbrPartageAMoi(long nbrPartageAMoi) {
        this.nbrPartageAMoi = nbrPartageAMoi;
    }
}
