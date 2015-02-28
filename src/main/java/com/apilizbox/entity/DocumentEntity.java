package com.apilizbox.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by laurent on 08/05/2014.
 */
@Entity
@Table(name = "document", schema = "", catalog = "lizbox")
public class DocumentEntity {
    private String id;
    private String nom;
    private String extension;
    private int user;
    private String dossierparent;
    private String typefichier;
    private byte estfichier;
    private Timestamp creation;
    private Timestamp modification;
    private int taille;
    private Byte partagepublic;
    private Byte partageprivee;

    @Id
    @Column(name = "ID")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "nom")
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Basic
    @Column(name = "extension")
    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    @Basic
    @Column(name = "user")
    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    @Basic
    @Column(name = "dossierparent")
    public String getDossierparent() {
        return dossierparent;
    }

    public void setDossierparent(String dossierparent) {
        this.dossierparent = dossierparent;
    }

    @Basic
    @Column(name = "typefichier")
    public String getTypefichier() {
        return typefichier;
    }

    public void setTypefichier(String typefichier) {
        this.typefichier = typefichier;
    }

    @Basic
    @Column(name = "estfichier")
    public byte getEstfichier() {
        return estfichier;
    }

    public void setEstfichier(byte estfichier) {
        this.estfichier = estfichier;
    }

    @Basic
    @Column(name = "creation")
    public Timestamp getCreation() {
        return creation;
    }

    public void setCreation(Timestamp creation) {
        this.creation = creation;
    }

    @Basic
    @Column(name = "modification")
    public Timestamp getModification() {
        return modification;
    }

    public void setModification(Timestamp modification) {
        this.modification = modification;
    }

    @Basic
    @Column(name = "taille")
    public int getTaille() {
        return taille;
    }

    public void setTaille(int taille) {
        this.taille = taille;
    }

    @Basic
    @Column(name = "partagepublic")
    public Byte getPartagepublic() {
        return partagepublic;
    }

    public void setPartagepublic(Byte partagepublic) {
        this.partagepublic = partagepublic;
    }

    @Basic
    @Column(name = "partageprivee")
    public Byte getPartageprivee() {
        return partageprivee;
    }

    public void setPartageprivee(Byte partageprivee) {
        this.partageprivee = partageprivee;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DocumentEntity that = (DocumentEntity) o;

        if (estfichier != that.estfichier) return false;
        if (taille != that.taille) return false;
        if (user != that.user) return false;
        if (creation != null ? !creation.equals(that.creation) : that.creation != null) return false;
        if (dossierparent != null ? !dossierparent.equals(that.dossierparent) : that.dossierparent != null)
            return false;
        if (extension != null ? !extension.equals(that.extension) : that.extension != null) return false;
        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (modification != null ? !modification.equals(that.modification) : that.modification != null) return false;
        if (nom != null ? !nom.equals(that.nom) : that.nom != null) return false;
        if (partageprivee != null ? !partageprivee.equals(that.partageprivee) : that.partageprivee != null)
            return false;
        if (partagepublic != null ? !partagepublic.equals(that.partagepublic) : that.partagepublic != null)
            return false;
        if (typefichier != null ? !typefichier.equals(that.typefichier) : that.typefichier != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (extension != null ? extension.hashCode() : 0);
        result = 31 * result + user;
        result = 31 * result + (dossierparent != null ? dossierparent.hashCode() : 0);
        result = 31 * result + (typefichier != null ? typefichier.hashCode() : 0);
        result = 31 * result + (int) estfichier;
        result = 31 * result + (creation != null ? creation.hashCode() : 0);
        result = 31 * result + (modification != null ? modification.hashCode() : 0);
        result = 31 * result + taille;
        result = 31 * result + (partagepublic != null ? partagepublic.hashCode() : 0);
        result = 31 * result + (partageprivee != null ? partageprivee.hashCode() : 0);
        return result;
    }
}
