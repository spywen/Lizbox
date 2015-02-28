package com.apilizbox.utils;

/**
 * Created by laurent on 26/03/2014.
 * Facade relative au téléchargement d'un fichier. Contient toutes les informations nécessaires au téléchargement
 */
public class DocumentDownloadFacade {
    private String id;
    private String name;
    private byte[] file;
    private String contentType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String nom, String extension) {
        this.name = new StringBuilder()
                .append(nom)
                .append(".")
                .append(extension)
                .toString();
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = new StringBuilder()
                .append(contentType)
                .toString();
    }
}
