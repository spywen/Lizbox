package com.apilizbox.utils;

/**
 * Created by laurent on 17/03/2014.
 * Classe répertoriant les rôles ainsi que des associations de rôles souvent utilisées
 */
public class GroupeRoles {
    public static final String ROLE_FREE = "ROLE_FREE";
    public static final String ROLE_PREMIUM = "ROLE_PREMIUM";
    public static final String ROLE_PRO = "ROLE_PRO";
    public static final String ROLE_ADMIN = "ROLE_ADMIN";

    public static final String ALL = "ROLE_FREE,ROLE_PREMIUM,ROLE_PRO,ROLE_ADMIN";
    public static final String NOTFREE = "ROLE_PREMIUM,ROLE_PRO,ROLE_ADMIN";
    public static final String PROS = "ROLE_PREMIUM,ROLE_PRO,ROLE_ADMIN";
}
