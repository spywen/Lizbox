package com.apilizbox.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Laurent on 02/02/14.
 */
@Entity
@Table(name = "utilisateur", schema = "", catalog = "lizbox")
public class UtilisateurEntity {
    private int id;
    private String nom;
    private String prenom;
    private byte male;
    private String pseudo;
    private String email;
    private String password;
    private String role;
    private Timestamp inscription;
    private byte actif;

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
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
    @Column(name = "prenom")
    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    @Basic
    @Column(name = "male")
    public byte getMale() {
        return male;
    }

    public void setMale(byte male) {
        this.male = male;
    }

    @Basic
    @Column(name = "pseudo")
    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "role")
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Basic
    @Column(name = "inscription")
    public Timestamp getInscription() {
        return inscription;
    }

    public void setInscription(Timestamp inscription) {
        this.inscription = inscription;
    }

    @Basic
    @Column(name = "actif")
    public byte getActif() {
        return actif;
    }

    public void setActif(byte actif) {
        this.actif = actif;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UtilisateurEntity that = (UtilisateurEntity) o;

        if (actif != that.actif) return false;
        if (id != that.id) return false;
        if (male != that.male) return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        if (inscription != null ? !inscription.equals(that.inscription) : that.inscription != null) return false;
        if (nom != null ? !nom.equals(that.nom) : that.nom != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;
        if (prenom != null ? !prenom.equals(that.prenom) : that.prenom != null) return false;
        if (pseudo != null ? !pseudo.equals(that.pseudo) : that.pseudo != null) return false;
        if (role != null ? !role.equals(that.role) : that.role != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (prenom != null ? prenom.hashCode() : 0);
        result = 31 * result + (int) male;
        result = 31 * result + (pseudo != null ? pseudo.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (role != null ? role.hashCode() : 0);
        result = 31 * result + (inscription != null ? inscription.hashCode() : 0);
        result = 31 * result + (int) actif;
        return result;
    }
}
