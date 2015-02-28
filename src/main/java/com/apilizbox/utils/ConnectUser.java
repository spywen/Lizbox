package com.apilizbox.utils;

import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.exception.ConnectUserException;
import com.apilizbox.repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

/**
 * Created by laurent on 16/02/2014.
 * Classe permettant de récupèrer le profil de l'utilisateur connecté sinon une exception
 * de type ConnectUserException est renvoyée
 */
@Service
public class ConnectUser {
    @Autowired
    private UtilisateurRepository utilisateurRepository;

    public UtilisateurEntity getConnectedUser() throws ConnectUserException{
        if (SecurityContextHolder.getContext() != null && SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() != null) {
            User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            String name = user.getUsername();
            return utilisateurRepository.findByPseudo(name);
        }
        throw new ConnectUserException("Aucune session utilisateur", "Il est nécessaire d'être connecté");
    }

}
