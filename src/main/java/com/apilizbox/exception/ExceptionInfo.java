package com.apilizbox.exception;

/**
 * Created by laurent on 15/05/2014.
 * Exception particulière qui sera renvoyée dans certain cas par le controllerAdvice.
 * En effet, certaines erreurs seront catchés de manière particulière de façon à pouvoir renvoyer un json contenant un message.
 * Ainsi on pourra clairement afficher coté client (toute device confondu) l'origine de l'erreur.
 */
public class ExceptionInfo{
    private String message;
    private String type = "danger";

    public ExceptionInfo() {}

    public ExceptionInfo(String message) {
        this.message = message;
    }

    public ExceptionInfo(String message, String niveau) {
        this.message = message;
        this.type = niveau;
    }

    //Inscription
    public  ExceptionInfo(InscriptionException uploadException){
        this.message = uploadException.getMessage();
        this.type = uploadException.getType();
    }

    //Document
    public  ExceptionInfo(DocumentException documentException){
        this.message = documentException.getMessage();
        this.type = documentException.getType();
    }

    //Partage
    public  ExceptionInfo(PartageException partageException){
        this.message = partageException.getMessage();
        this.type = partageException.getType();
    }

    //Upload
    public  ExceptionInfo(UploadException uploadException){
        this.message = uploadException.getMessage();
        this.type = uploadException.getType();
    }

    //Rights
    public  ExceptionInfo(RightException rightException){
        this.message = rightException.getMessage();
        this.type = rightException.getType();
    }

    public String getMessage() {
        return message;
    }

    public ExceptionInfo setMessage(String message) {
        this.message = message;
        return this;
    }

    public String getType() {
        return type;
    }

    public ExceptionInfo setType(String niveau) {
        this.type = niveau;
        return this;
    }
}
