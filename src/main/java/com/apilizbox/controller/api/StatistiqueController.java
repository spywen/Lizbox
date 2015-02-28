package com.apilizbox.controller.api;

import com.apilizbox.business.StatistiqueBusiness;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.utils.GroupeRoles;
import com.apilizbox.utils.statistiques.StatistiquesFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by laurent on 29/05/2014.
 */
@Controller
@RequestMapping("/api/statistiques")
public class StatistiqueController {
    @Autowired
    StatistiqueBusiness statistiqueBusiness;

    /**
     * Méthode de récupération de la facade de statistiques
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public StatistiquesFacade getStatistiques() throws ConnectUserException {
        return statistiqueBusiness.getStatistiques();

    }
}
