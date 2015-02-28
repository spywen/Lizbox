package com.apilizbox.business;

import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.utils.ConnectUser;
import com.apilizbox.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by laurent on 23/03/2014.
 */
@Service
public class MiscellaneousBusiness {
    @Autowired
    ConnectUser connectUser;

    /**
     * Méthode de récupération de l'URI qui permet de récupèrer le gravatar d'un utilisateur
     * @return
     * @throws ConnectUserException
     */
    public String getGravatar() throws ConnectUserException {
        UtilisateurEntity user = connectUser.getConnectedUser();
        return new StringBuilder()
                .append("http://www.gravatar.com/avatar/")
                .append(MD5Utils.md5Hex(user.getEmail()))
                .toString();
    }
}
