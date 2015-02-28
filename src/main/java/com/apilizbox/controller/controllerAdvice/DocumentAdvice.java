package com.apilizbox.controller.controllerAdvice;

import com.apilizbox.exception.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Created by laurent on 15/05/2014.
 * Classe permettant de catcher les exceptions et de renvoyer les messages d'erreurs associés sous forme JSON de
 * façon à pouvoir être inteprétés coté client (affichage du message d'erreur coté client)
 */
@ControllerAdvice
public class DocumentAdvice {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(DocumentException.class)
    @ResponseBody
    public ExceptionInfo docException(DocumentException ex) {
        return new ExceptionInfo(ex);
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(PartageException.class)
    @ResponseBody
    public ExceptionInfo shareException(PartageException ex){
        return new ExceptionInfo(ex);
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(UploadException.class)
    @ResponseBody
    public ExceptionInfo uploadException(UploadException ex){
        return new ExceptionInfo(ex);
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(InscriptionException.class)
    @ResponseBody
    public ExceptionInfo inscriptionException(InscriptionException ex){
        return new ExceptionInfo(ex);
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(RightException.class)
    @ResponseBody
    public ExceptionInfo rightException(RightException ex){
        return new ExceptionInfo(ex);
    }

}
