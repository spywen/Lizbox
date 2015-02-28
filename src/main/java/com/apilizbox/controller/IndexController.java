package com.apilizbox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by laurent on 08/02/2014.
 * Classe réperoriant l'accès aux pages principales de l'application lizbox
 */
@Controller
@RequestMapping("/")
public class IndexController {
    @RequestMapping(value={""}, method = RequestMethod.GET)
    public ModelAndView accueil() {
        ModelAndView modelAndView = new ModelAndView("accueil/index");
        return modelAndView;
    }

    @RequestMapping(value={"login"}, method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView("core/login");
        return modelAndView;
    }

    @RequestMapping(value={"inscription"}, method = RequestMethod.GET)
    public ModelAndView inscription() {
        ModelAndView modelAndView = new ModelAndView("core/inscription");
        return modelAndView;
    }

    @RequestMapping(value={"offres"}, method = RequestMethod.GET)
    public ModelAndView offres() {
        ModelAndView modelAndView = new ModelAndView("core/offres");
        return modelAndView;
    }

    @RequestMapping(value={"moncompte"}, method = RequestMethod.GET)
    public ModelAndView moncompte() {
        ModelAndView modelAndView = new ModelAndView("core/moncompte");
        return modelAndView;
    }


}
