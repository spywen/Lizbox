package com.apilizbox.controller.api;

import com.apilizbox.business.PartageBusiness;
import com.apilizbox.entity.PartageEntity;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.exception.DocumentException;
import com.apilizbox.exception.PartageException;
import com.apilizbox.exception.RightException;
import com.apilizbox.utils.GroupeRoles;
import com.apilizbox.utils.PublicShareFacade;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by laurent on 11/05/2014.
 */
@Controller
@RequestMapping("/api/partage")
public class PartageController {
    @Resource
    PartageBusiness partageBusiness;

    //PARTAGE PUBLIC

    /**
     * Récupération les informations de partage public d'un document :
     * - idDocument : id du document concerné
     * - isPublicShare : true si partagé publiquement
     * - publicShareLink : URL du partage public
     * @param id
     * @param request
     * @return
     * @throws ConnectUserException
     * @throws DocumentException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/public/{id}", method = {RequestMethod.GET}, produces = "application/json")
    @ResponseBody
    public PublicShareFacade getPublicShareLink(@PathVariable String id, HttpServletRequest request) throws ConnectUserException, DocumentException, RightException {
        return partageBusiness.getPublicShareLink(id, request);
    }

    /**
     * Enabled/Disabled le partage public
     * @param id
     * @param isActive
     * @throws ConnectUserException
     * @throws DocumentException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/public",params = {"idDocument","isActive"}, method = {RequestMethod.PUT})
    @ResponseBody
    public void updatePublicShare(@RequestParam(value = "idDocument")  String id, @RequestParam(value = "isActive") String isActive) throws ConnectUserException, DocumentException, RightException {
        partageBusiness.activePublicShare(id, isActive);
    }


    //PARTAGE PRIVEE

    /**
     * Enabled/Disabled partage privé
     * @param id
     * @param isActive
     * @throws ConnectUserException
     * @throws DocumentException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/private",params = {"idDocument","isActive"}, method = {RequestMethod.PUT})
    @ResponseBody
    public void activePrivateShare(@RequestParam(value = "idDocument") String id, @RequestParam(value = "isActive") String isActive) throws ConnectUserException, DocumentException, RightException {
        partageBusiness.activePrivateShare(id, isActive);
    }

    /**
     * Récupèrer la liste des partages d'un document
     * @param id
     * @return
     * @throws DocumentException
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/private", params = {"idDocument"}, method = {RequestMethod.GET}, produces = "application/json")
    @ResponseBody
    public List<PartageEntity> getDocumentPrivateShare(@RequestParam(value = "idDocument")  String id) throws DocumentException, ConnectUserException, RightException {
        return partageBusiness.getPrivateShare(id);
    }

    /**
     * Créer un partage privé
     * @param recepteurLabel
     * @param idDocument
     * @return
     * @throws PartageException
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/private", params = {"idDocument","recepteurLabel"}, method = {RequestMethod.GET}, produces = "application/json")
    @ResponseBody
    public PartageEntity createPrivateShare(@RequestParam(value = "recepteurLabel") String recepteurLabel,@RequestParam(value = "idDocument") String idDocument) throws PartageException, ConnectUserException, DocumentException, RightException {
        return partageBusiness.createPrivateShare(idDocument, recepteurLabel);
    }

    /**
     * Ajouter ou enlever les droits en écriture
     * @param id
     * @param haveWriteRight
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/private/{id}", params = {"haveWriteRight"}, method = {RequestMethod.PUT})
    @ResponseBody
    public void update(@PathVariable int id, @RequestParam(value = "haveWriteRight") String haveWriteRight) {
        partageBusiness.update(id, haveWriteRight);
    }

    /**
     * Supprimer un partage (privé)
     * @param id
     * @throws PartageException
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/private/{id}", method = {RequestMethod.DELETE}, produces = "application/json")
    @ResponseBody
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void delete(@PathVariable int id) throws PartageException, ConnectUserException {
        partageBusiness.deleteShare(id);
    }

}
