package com.apilizbox.repository.impl;

import com.apilizbox.repository.custom.UtilisateurRepositoryCustom;

import javax.sql.DataSource;

/**
 * Created by Laurent on 10/01/14.
 */
public class UtilisateurRepositoryImpl implements UtilisateurRepositoryCustom {
    private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
}
