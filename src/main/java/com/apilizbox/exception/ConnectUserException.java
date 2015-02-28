package com.apilizbox.exception;

/**
 * Created by laurent on 16/02/2014.
 * Exception relative aux erreurs de connexion
 */
public class ConnectUserException extends Exception{
    private String type;
    private String message;



    public ConnectUserException(String type, String message) {
        super(message);
        this.type = type;
        this.message = message;
    }
}
