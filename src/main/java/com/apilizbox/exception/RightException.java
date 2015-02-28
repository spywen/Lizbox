package com.apilizbox.exception;

/**
 * Created by laurent on 30/05/2014.
 * Exception relative aux erreurs de droits sur un document
 */
public class RightException extends Exception {
    private String type;
    private String message;

    public RightException(String type, String message) {
        super(message);
        this.type = type;
        this.message = message;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
