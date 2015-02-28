package com.apilizbox.controller.api;

import com.apilizbox.business.UtilisateurBusiness;
import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.exception.InscriptionException;
import com.apilizbox.utils.GroupeRoles;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * Created by Laurent on 10/01/14.
 */
@Controller
@RequestMapping("/api/utilisateurs")
public class UtilisateurController {

    private final static Logger logger = LoggerFactory.getLogger(UtilisateurController.class);
    @Resource
    UtilisateurBusiness utilisateurBusiness;

    /**
     * Récupèrer l'ensemble des utilisateurs
     * @return
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ROLE_ADMIN +"')")
    @Transactional
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<UtilisateurEntity> findAll(){
        return utilisateurBusiness.findAll();
    }

    /**
     * Récupèrer un utilisateur via son id
     * @param id
     * @return
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL + "')")
    @Transactional
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public UtilisateurEntity findOne(@PathVariable int id) throws ConnectUserException {
        return utilisateurBusiness.findOne(id);
    }

    /**
     * SOIT créer un utilisateur si on ne précise pas l'attribut id
     * @param utilisateurEntity
     * @return
     */
    @RequestMapping(method = {RequestMethod.POST}, produces = "application/json")
    @ResponseBody
    public UtilisateurEntity save(@RequestBody @Valid UtilisateurEntity utilisateurEntity) throws InscriptionException {
        return utilisateurBusiness.save(utilisateurEntity);
    }

    /**
     * SOIT modifier un utilisateur si on précise l'id
     * @param utilisateurEntity
     * @return
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL + "')")
    @RequestMapping(method = {RequestMethod.PUT}, produces = "application/json")
    @ResponseBody
    public UtilisateurEntity update(@RequestBody @Valid UtilisateurEntity utilisateurEntity) throws InscriptionException {
        return utilisateurBusiness.save(utilisateurEntity);
    }

    /**
     * Récupère l'id de la personne qui souhaite se connecter
     * @param utilisateurEntity
     * @return
     */
    @Transactional
    @RequestMapping(value = "/login", method = {RequestMethod.POST}, produces = "application/json")
    @ResponseBody
    public Integer login(@RequestBody @Valid UtilisateurEntity utilisateurEntity){
        return utilisateurBusiness.login(utilisateurEntity);
    }

    /**
     * Méthode permettant de déterminer si un pseudo est déjà utilisé ou non
     * @param request
     * @return
     */
    @Transactional
    @RequestMapping(value = "/pseudoFree", method = {RequestMethod.POST}, produces = "application/json")
    @ResponseBody
    public boolean pseudoFree(HttpServletRequest request){
        return utilisateurBusiness.pseudoFree(request.getParameter("pseudo"));
    }

    /**
     * Méthode permettant de déterminer si un email est déjà utilisé ou non
     * @param request
     * @return
     */
    @Transactional
    @RequestMapping(value = "/emailFree", method = {RequestMethod.POST}, produces = "application/json")
    @ResponseBody
    public boolean emailFree(HttpServletRequest request){
        return utilisateurBusiness.emailFree(request.getParameter("email"));
    }


}
