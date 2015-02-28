package com.apilizbox.entity;

import javax.persistence.*;

/**
 * Created by laurent on 16/02/2014.
 */
@Entity
@Table(name = "plan", schema = "", catalog = "lizbox")
public class PlanEntity {
    private long espace;
    private float prix;
    private String bandepassante;
    private long duree;
    private String nom;
    private String label;
    private byte android;
    private byte desktop;



    @Basic
    @Column(name = "espace")
    public long getEspace() {
        return espace;
    }

    public void setEspace(long espace) {
        this.espace = espace;
    }

    @Basic
    @Column(name = "prix")
    public float getPrix() {
        return prix;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    @Basic
    @Column(name = "bandepassante")
    public String getBandepassante() {
        return bandepassante;
    }

    public void setBandepassante(String bandepassante) {
        this.bandepassante = bandepassante;
    }

    @Basic
    @Column(name = "duree")
    public long getDuree() {
        return duree;
    }

    public void setDuree(long duree) {
        this.duree = duree;
    }

    @Id
    @Column(name = "nom")
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Basic
    @Column(name = "label")
    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    @Basic
    @Column(name = "android")
    public byte getAndroid() {
        return android;
    }

    public void setAndroid(byte android) {
        this.android = android;
    }

    @Basic
    @Column(name = "desktop")
    public byte getDesktop() {
        return desktop;
    }

    public void setDesktop(byte desktop) {
        this.desktop = desktop;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PlanEntity that = (PlanEntity) o;

        if (android != that.android) return false;
        if (desktop != that.desktop) return false;
        if (duree != that.duree) return false;
        if (espace != that.espace) return false;
        if (Float.compare(that.prix, prix) != 0) return false;
        if (bandepassante != null ? !bandepassante.equals(that.bandepassante) : that.bandepassante != null)
            return false;
        if (label != null ? !label.equals(that.label) : that.label != null) return false;
        if (nom != null ? !nom.equals(that.nom) : that.nom != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (espace ^ (espace >>> 32));
        result = 31 * result + (prix != +0.0f ? Float.floatToIntBits(prix) : 0);
        result = 31 * result + (bandepassante != null ? bandepassante.hashCode() : 0);
        result = 31 * result + (int) (duree ^ (duree >>> 32));
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (label != null ? label.hashCode() : 0);
        result = 31 * result + (int) android;
        result = 31 * result + (int) desktop;
        return result;
    }
}
