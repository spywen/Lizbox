package com.apilizbox.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Laurent on 02/02/14.
 */
@Entity
@Table(name = "notification", schema = "", catalog = "lizbox")
public class NotificationEntity {
    private int id;
    private int utilisateur;
    private String type;
    private Timestamp date;
    private Timestamp lecture;
    private String message;
    private String titre;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "date")
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Basic
    @Column(name = "lecture")
    public Timestamp getLecture() {
        return lecture;
    }

    public void setLecture(Timestamp lecture) {
        this.lecture = lecture;
    }

    @Basic
    @Column(name = "message")
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Basic
    @Column(name = "titre")
    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        NotificationEntity that = (NotificationEntity) o;

        if (id != that.id) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (utilisateur != that.utilisateur) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (titre != null ? !titre.equals(that.titre) : that.titre != null) return false;
        if (message != null ? !message.equals(that.message) : that.message != null) return false;
        if (lecture != null ? !lecture.equals(that.lecture) : that.lecture != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + utilisateur;
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (lecture != null ? lecture.hashCode() : 0);
        result = 31 * result + (message != null ? message.hashCode() : 0);
        result = 31 * result + (titre != null ? titre.hashCode() : 0);
        return result;
    }
}
