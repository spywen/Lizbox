package com.apilizbox.utils;

/**
 * Created by laurent on 14/05/2014.
 * Facade relative à un partage privé
 */
public class DocumentPartageFacade {
    private int partageId;
    private String email;
    private String pseudo;
    private boolean droitEcriture;

    public int getPartageId() {
        return partageId;
    }

    public void setPartageId(int partageId) {
        this.partageId = partageId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public boolean isDroitEcriture() {
        return droitEcriture;
    }

    public void setDroitEcriture(boolean droitEcriture) {
        this.droitEcriture = droitEcriture;
    }
}
