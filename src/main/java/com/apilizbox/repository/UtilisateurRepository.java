package com.apilizbox.repository;

import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.repository.custom.UtilisateurRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Laurent on 06/01/14.
 */
public interface UtilisateurRepository extends JpaRepository<UtilisateurEntity,Integer>,UtilisateurRepositoryCustom {
    @Query(value = "SELECT ID FROM utilisateur WHERE (BINARY pseudo=?1 OR BINARY email=?1) AND password=?2", nativeQuery = true)
    Integer login(String pseudo, String password);

    long countByPseudo(String pseudo);
    long countByEmail(String email);
    UtilisateurEntity findByPseudo(String username);
    UtilisateurEntity findByEmail(String email);

}
