package com.apilizbox.utils;

import com.apilizbox.entity.DocumentEntity;

/**
 * Created by laurent on 12/05/2014.
 * Facade utilisé pour renvoyé à la page de partage public les informations sur le document partagé
 */
public class PublicSharePageFacade {
    private String downloadLink;
    private DocumentEntity document;

    public String getDownloadLink() {
        return downloadLink;
    }

    public void setDownloadLink(String downloadLink) {
        this.downloadLink = downloadLink;
    }

    public DocumentEntity getDocument() {
        return document;
    }

    public void setDocument(DocumentEntity document) {
        this.document = document;
    }
}
