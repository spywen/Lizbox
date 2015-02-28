package com.apilizbox.controller;

import com.apilizbox.business.DocumentBusiness;
import com.apilizbox.business.PartageBusiness;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.exception.DocumentException;
import com.apilizbox.exception.PartageException;
import com.apilizbox.exception.RightException;
import com.apilizbox.utils.DocumentDownloadFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by laurent on 11/05/2014.
 */
@Controller
@RequestMapping("/share")
public class PartagesController {
    @Autowired
    DocumentBusiness documentBusiness;

    @Autowired
    PartageBusiness partageBusiness;

    /**
     * Méthode d'accès à la page d'un document partagé (si document non partagé -> page d'erreur)
     * @param id
     * @param request
     * @return
     * @throws DocumentException
     * @throws ConnectUserException
     * @throws IOException
     * @throws PartageException
     */
    @RequestMapping(value={"/public/{id}"},method = RequestMethod.GET)
    public ModelAndView publicShare(@PathVariable String id, HttpServletRequest request) throws DocumentException, ConnectUserException, IOException, PartageException {
        if(partageBusiness.isPublicShare(id)){
            ModelAndView modelAndView = new ModelAndView("partage/publicShare");
            modelAndView.addObject("publicSharePageObject",partageBusiness.getPublicSharePageObject(id,request));
            return modelAndView;
        }else{
            return new ModelAndView("partage/publicNoShare");
        }

    }

    /**
     * Méthode de download d'un document partagé
     * @param id
     * @param response
     * @throws DocumentException
     * @throws ConnectUserException
     * @throws IOException
     * @throws PartageException
     * @throws RightException
     */
    @RequestMapping(value={"/public/download/{id}"},method = RequestMethod.GET)
    public void publicShareDownload(@PathVariable String id, HttpServletResponse response) throws DocumentException, ConnectUserException, IOException, PartageException, RightException {
        if(partageBusiness.isPublicShare(id)){
            DocumentDownloadFacade documentDownloadFacade = documentBusiness.download(id);
            OutputStream out = response.getOutputStream();
            response.setContentType(documentDownloadFacade.getContentType());
            response.setHeader("Content-Disposition","attachment;filename="+documentDownloadFacade.getName());
            byte[] doc = documentDownloadFacade.getFile();
            out.write(doc);
            out.flush();
        }else{
            throw new PartageException("Forbidden","Fichier non partagé");
        }
    }

}