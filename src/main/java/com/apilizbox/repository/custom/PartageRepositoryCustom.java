package com.apilizbox.repository.custom;

import com.apilizbox.utils.DocumentPartageFacade;

import java.util.List;

/**
 * Created by laurent on 14/05/2014.
 */
public interface PartageRepositoryCustom {
    List<DocumentPartageFacade> getPartagesPrivees();
}
