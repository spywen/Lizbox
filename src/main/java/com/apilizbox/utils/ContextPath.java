package com.apilizbox.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by laurent on 11/05/2014.
 * Classe permettant de récupèrer le context path <=> (par exemple) http://lizbox.com:80/documents
 * (Remarque ceci dépend exclusivement de la requête)
 */
public class ContextPath {
    public static String getURLWithContextPath(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }
}
