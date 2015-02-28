package com.apilizbox.controller.api;

import com.apilizbox.business.DocumentBusiness;
import com.apilizbox.entity.DocumentEntity;
import com.apilizbox.exception.*;
import com.apilizbox.utils.DocumentDownloadFacade;
import com.apilizbox.utils.GroupeRoles;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * Created by laurent on 15/02/2014.
 */
@Controller
@RequestMapping("/api/documents")
public class DocumentController {
    @Resource
    DocumentBusiness documentBusiness;


    /**
     * Remarque : le dossier "root" de l'utilisateur n'est pas défini en base de données.
     * Pour accèder à son contenu, avec les divers méthodes suivantes, son id est "0".
     * Ainsi, un utilisateur connecté peut faire une requête sur la méthode "findFolderContent" avec comme paramètre : "0".
     * Il accèdera ainsi à l'intégralité de ses documents, à la racine de sa box.
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<DocumentEntity> findRootFileByUser() throws ConnectUserException {
        return documentBusiness.findRootFileByUser();
    }

    /**
     * Permet d'ouvrir un dossier
     * @param idDossierParent
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(params = {"idDossierparent"}, method = {RequestMethod.GET}, produces = "application/json")
    @ResponseBody
    public List<DocumentEntity> findFolderContent(@RequestParam(value = "idDossierparent")  String idDossierParent) throws ConnectUserException {
        return documentBusiness.findFolderContent(idDossierParent,true);
    }

    /**
     * Permet d'ouvrir un dossier
     * @param idDossierParent
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "withoutReturnFolder", params = {"idDossierparent"}, method = {RequestMethod.GET}, produces = "application/json")
    @ResponseBody
    public List<DocumentEntity> findFolderContentWithOutReturnFolder(@RequestParam(value = "idDossierparent")  String idDossierParent) throws ConnectUserException {
        return documentBusiness.findFolderContent(idDossierParent,false);
    }

    /**
     * Supprimer un document
     * @param id
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws IOException
     * @throws RightException
     * @throws PartageException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/{id}", method = {RequestMethod.DELETE}, produces = "application/json")
    @ResponseBody
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) throws ConnectUserException, DocumentException, IOException, RightException, PartageException {
        documentBusiness.remove(id);
    }

    /**
     * Créer un dossier
     * @param documentEntity
     * @return
     * @throws ConnectUserException
     * @throws DocumentException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(method = {RequestMethod.POST})
    @ResponseBody
    public DocumentEntity createFolder(@RequestBody @Valid DocumentEntity documentEntity) throws ConnectUserException, DocumentException {
        return documentBusiness.createFolder(documentEntity);
    }

    /**
     * Modifier l'emplacement d'un document
     * @param idDossier
     * @param idDocument
     * @return
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws RightException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(params = {"idDossier","idDocument"}, method = {RequestMethod.PUT})
    @ResponseBody
    public DocumentEntity move(@RequestParam(value = "idDossier")  String idDossier, @RequestParam(value = "idDocument")  String idDocument) throws ConnectUserException, DocumentException, RightException {
        return documentBusiness.move(idDossier, idDocument);
    }

    /**
     * Retourne l'arborescence d'un document (pour le breadcrumb (fil d'Arianne))
     * @param id
     * @return
     * @throws DocumentException
     * @throws ConnectUserException
     * @throws RightException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = {"/arbo/{id}"}, method = {RequestMethod.GET})
    @ResponseBody
    public List<DocumentEntity> findArborescence(@PathVariable String id) throws DocumentException, ConnectUserException, RightException {
        return documentBusiness.findArborescence(id);
    }

    /**
     * Méthode de téléchargement d'un fichier
     * @param id
     * @param response
     * @throws ConnectUserException
     * @throws IOException
     * @throws DocumentException
     * @throws RightException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/download/{id}", method = {RequestMethod.GET})
    @ResponseBody
    public void download(@PathVariable String id, HttpServletResponse response) throws ConnectUserException, IOException, DocumentException, RightException {
        DocumentDownloadFacade documentDownloadFacade = documentBusiness.download(id);
        OutputStream out = response.getOutputStream();
        response.setContentType(documentDownloadFacade.getContentType());
        response.setHeader("Content-Disposition","attachment;filename="+documentDownloadFacade.getName());
        byte[] doc = documentDownloadFacade.getFile();
        out.write(doc);
        out.flush();
    }

    /**
     * Méthode d'upload pour les applications autres que web
     * @param file
     * @param idDossierParent
     * @throws IOException
     * @throws ConnectUserException
     * @throws DocumentException
     * @throws UploadException
     * @throws RightException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @RequestMapping(value = "/upload/{idDossierParent}", method = RequestMethod.POST)
    @ResponseBody
    public void uploadFileHandler(@RequestParam("file") MultipartFile file, @PathVariable String idDossierParent) throws IOException, ConnectUserException, DocumentException, UploadException, RightException {
        documentBusiness.upload(file, idDossierParent, false);
    }
}
