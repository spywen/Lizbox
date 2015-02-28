package com.apilizbox.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Laurent on 02/02/14.
 */
@Entity
@Table(name = "souscription", schema = "", catalog = "lizbox")
public class SouscriptionEntity {
    private int id;
    private Timestamp debut;
    private int utilisateur;
    private int plan;
    private Timestamp fin;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "utilisateur")
    public int getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(int utilisateur) {
        this.utilisateur = utilisateur;
    }

    @Basic
    @Column(name = "plan")
    public int getPlan() {
        return plan;
    }

    public void setPlan(int plan) {
        this.plan = plan;
    }

    @Basic
    @Column(name = "fin")
    public Timestamp getFin() {
        return fin;
    }

    public void setFin(Timestamp fin) {
        this.fin = fin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SouscriptionEntity that = (SouscriptionEntity) o;

        if (id != that.id) return false;
        if (plan != that.plan) return false;
        if (utilisateur != that.utilisateur) return false;
        if (debut != null ? !debut.equals(that.debut) : that.debut != null) return false;
        if (fin != null ? !fin.equals(that.fin) : that.fin != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (debut != null ? debut.hashCode() : 0);
        result = 31 * result + utilisateur;
        result = 31 * result + plan;
        result = 31 * result + (fin != null ? fin.hashCode() : 0);
        return result;
    }
}
