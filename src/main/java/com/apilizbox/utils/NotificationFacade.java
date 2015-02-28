package com.apilizbox.utils;

import java.sql.Timestamp;

/**
 * Created by laurent on 15/02/2014.
 * Facade relative à une notification
 */
public class NotificationFacade {
    private int id;
    private String titre;
    private String message;
    private Timestamp date;
    private String type;
    private boolean lu;

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean isLu() {
        return lu;
    }

    public void setLu(boolean lu) {
        this.lu = lu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
