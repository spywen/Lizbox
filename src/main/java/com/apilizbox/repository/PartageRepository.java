package com.apilizbox.repository;

import com.apilizbox.entity.PartageEntity;
import com.apilizbox.entity.UtilisateurEntity;
import com.apilizbox.repository.custom.PartageRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by laurent on 14/05/2014.
 */
public interface PartageRepository extends JpaRepository<PartageEntity,Integer>,PartageRepositoryCustom {
    List<PartageEntity> findAllByEmeteurAndDocument(UtilisateurEntity emeteur, String documentId);
    List<PartageEntity> findAllByDocument(String documentId);
    List<PartageEntity> findAllByRecepteur(UtilisateurEntity recepteur);
    PartageEntity findAllByRecepteurAndDocument(UtilisateurEntity recepteur, String documentId);
    long countByRecepteurAndDocument(UtilisateurEntity recepteur, String idDocument);
    long countByDocument(String idDocument);

    @Query(value = "SELECT count(*) FROM partage WHERE emeteur=?1", nativeQuery = true)
    long countPrivateShare(int id);
    @Query(value = "SELECT count(*) FROM partage WHERE recepteur=?1", nativeQuery = true)
    long countShareToMe(int id);
}
