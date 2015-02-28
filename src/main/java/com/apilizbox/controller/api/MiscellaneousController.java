package com.apilizbox.controller.api;

import com.apilizbox.business.MiscellaneousBusiness;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.utils.GroupeRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by laurent on 23/03/2014.
 */
@Component
@RequestMapping("/api/miscellaneous")
public class MiscellaneousController {
    @Autowired
    MiscellaneousBusiness miscellaneousBusiness;

    /**
     * Récupération de l'adresse URI permettant de récupèrer l'avatar d'un utilisateur
     * Remarque : via le service externe GRAVATAR (gravatar.com)
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public String getGravatar() throws ConnectUserException {
        return miscellaneousBusiness.getGravatar();
    }
}
