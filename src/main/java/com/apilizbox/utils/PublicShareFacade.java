package com.apilizbox.utils;

/**
 * Created by laurent on 11/05/2014.
 * Facade relative au partage public d'un document
 */
public class PublicShareFacade {
    private String idDocument;
    private Boolean isPublicShare;
    private String publicShareLink;

    public Boolean getIsPublicShare() {
        return isPublicShare;
    }

    public void setIsPublicShare(Boolean isPublicShare) {
        this.isPublicShare = isPublicShare;
    }

    public String getPublicShareLink() {
        return publicShareLink;
    }

    public void setPublicShareLink(String publicShareLink) {
        this.publicShareLink = publicShareLink;
    }

    public String getIdDocument() {
        return idDocument;
    }

    public void setIdDocument(String idDocument) {
        this.idDocument = idDocument;
    }
}
