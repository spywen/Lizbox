package com.apilizbox.controller;

import com.apilizbox.business.DocumentBusiness;
import com.apilizbox.exception.UploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by laurent on 09/02/2014.
 */
@Controller
@RequestMapping("/documents")
public class DocumentsController {
    @Autowired
    DocumentBusiness documentBusiness;

    /**
     * Accès à la page de gestion de ses documents
     * @return
     */
    @RequestMapping(value={""},method = RequestMethod.GET)
    public ModelAndView documents() {
        ModelAndView modelAndView = new ModelAndView("core/index");
        return modelAndView;
    }

    /**
     * Accès à la page de gestion de l'envoie d'un document (upload)
     * @return
     */
    @RequestMapping(value={"upload"}, method = RequestMethod.GET)
    public ModelAndView upload() {
        ModelAndView modelAndView = new ModelAndView("core/upload");
        return modelAndView;
    }

    /**
     * Méthode permettant d'uploader un fichier depuis le site web
     * @param file
     * @return
     * @throws java.io.IOException
     * @throws com.apilizbox.exception.ConnectUserException
     * @throws com.apilizbox.exception.DocumentException
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView upload(@RequestParam("file") MultipartFile file, @RequestParam("idDossierParent") String idDossierParent) {
        ModelAndView modelAndView = new ModelAndView("redirect:/documents");
        try{
            documentBusiness.upload(file, idDossierParent, true);
        }catch(UploadException e){
            modelAndView.addObject("error",e.getMessage());
            modelAndView.setViewName("core/upload");
        } catch(Exception e){
            modelAndView.addObject("error","Une erreur est survenue pendant l'upload de votre document.");
            modelAndView.setViewName("core/upload");
        }
        return modelAndView;
    }
}

