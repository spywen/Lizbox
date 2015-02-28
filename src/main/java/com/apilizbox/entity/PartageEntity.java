package com.apilizbox.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by laurent on 08/05/2014.
 */
@Entity
@Table(name = "partage", schema = "", catalog = "lizbox")
public class PartageEntity {
    private int id;
    private String document;
    private UtilisateurEntity emeteur;
    private UtilisateurEntity recepteur;
    private Timestamp debut;
    private byte ecriture;
    private byte accepte;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "document")
    public String getDocument() {
        return document;
    }

    public void setDocument(String document) {
        this.document = document;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "emeteur", referencedColumnName = "ID")
    public UtilisateurEntity getEmeteur() {
        return emeteur;
    }

    public void setEmeteur(UtilisateurEntity emeteur) {
        this.emeteur = emeteur;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "recepteur", referencedColumnName = "ID")
    public UtilisateurEntity getRecepteur() {
        return recepteur;
    }

    public void setRecepteur(UtilisateurEntity recepteur) {
        this.recepteur = recepteur;
    }

    @Basic
    @Column(name = "debut")
    public Timestamp getDebut() {
        return debut;
    }

    public void setDebut(Timestamp debut) {
        this.debut = debut;
    }

    @Basic
    @Column(name = "ecriture")
    public byte getEcriture() {
        return ecriture;
    }

    public void setEcriture(byte ecriture) {
        this.ecriture = ecriture;
    }

    @Basic
    @Column(name = "accepte")
    public byte getAccepte() {
        return accepte;
    }

    public void setAccepte(byte accepte) {
        this.accepte = accepte;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PartageEntity that = (PartageEntity) o;

        if (accepte != that.accepte) return false;
        if (ecriture != that.ecriture) return false;
        if (emeteur != that.emeteur) return false;
        if (id != that.id) return false;
        if (recepteur != that.recepteur) return false;
        if (debut != null ? !debut.equals(that.debut) : that.debut != null) return false;
        if (document != null ? !document.equals(that.document) : that.document != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (document != null ? document.hashCode() : 0);
        result = 31 * result + (emeteur != null ? emeteur.hashCode() : 0);
        result = 31 * result + (recepteur != null ? recepteur.hashCode() : 0);
        result = 31 * result + (debut != null ? debut.hashCode() : 0);
        result = 31 * result + (int) ecriture;
        result = 31 * result + (int) accepte;
        return result;
    }
}
