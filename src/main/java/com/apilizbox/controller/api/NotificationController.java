package com.apilizbox.controller.api;

import com.apilizbox.business.NotificationBusiness;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.utils.GroupeRoles;
import com.apilizbox.utils.NotificationFacade;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by laurent on 15/02/2014.
 */

@Controller
@RequestMapping("/api/notifications")
public class NotificationController {
    @Resource
    NotificationBusiness notificationBusiness;

    /**
     * Récupèrer toutes les notifications de l'utilisateur de la plus récente à la plus ancienne
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<NotificationFacade> findAllByUser() throws ConnectUserException {
        return notificationBusiness.findAllByUser(0);
    }

    /**
     * Récupèrer un certain nombre des dernières notifications de l'utilisateur de la plus récente à la plus ancienne
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(params = {"count"},method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<NotificationFacade> findAllByUserLimit(@RequestParam(value = "count") int count) throws ConnectUserException {
        return notificationBusiness.findAllByUser(count);
    }

    /**
     * Récupèrer toutes les notifications non lu de l'utilisateur (+ recente -> + ancienne)
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value="/unread", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<NotificationFacade> findAllByUserNoRead() throws ConnectUserException {
        return notificationBusiness.findAllByUserNoRead(0);
    }

    /**
     * Récupèrer toutes les notifications non lu de l'utilisateur (+ recente -> + ancienne)
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value="/unread", params = {"count"}, method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<NotificationFacade> findAllByUserNoReadLimit(@RequestParam(value = "count")  int count) throws ConnectUserException {
        return notificationBusiness.findAllByUserNoRead(count);
    }

    /**
     * Récupèrer toutes les notifications lu de l'utilisateur (+ recente -> + ancienne)
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value="/read", params = {"count"}, method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<NotificationFacade> findAllByUserReadLimit(@RequestParam(value = "count")  int count) throws ConnectUserException {
        return notificationBusiness.findAllByUserRead(count);
    }

    /**
     * Indiquer qu'une notification a été lue
     * @param id
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/read/{id}",method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public void setNotificationLikeRead(@PathVariable int id) throws ConnectUserException {
        notificationBusiness.setNotificationLikeRead(id);
    }

    /**
     * Indiquer que toutes les notifications ont été lues
     * @return
     * @throws ConnectUserException
     */
    @PreAuthorize("hasAnyRole('"+ GroupeRoles.ALL +"')")
    @Transactional
    @RequestMapping(value = "/readAll",method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public void setAllNotificationLikeRead() throws ConnectUserException {
        notificationBusiness.setAllNotificationsAsRead();
    }


}
