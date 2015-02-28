package com.apilizbox.repository;

import com.apilizbox.entity.DocumentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by laurent on 15/02/2014.
 */
public interface DocumentRepository extends JpaRepository<DocumentEntity,String> {
    List<DocumentEntity> findAllByUserAndDossierparentOrderByEstfichierAsc(int id,String dossierparent);
    DocumentEntity findById(String id);
    long countByNomAndExtensionAndDossierparentAndUser(String nom, String extension, String dossierParent, int idUser);

    @Query(value = "SELECT count(*) FROM document WHERE user=?1 and estfichier=?2", nativeQuery = true)
    long countFileAndFolder(int id, boolean isFile);
    @Query(value = "SELECT count(*) FROM document WHERE user=?1 and partagepublic=?2", nativeQuery = true)
    long countPublicShare(int id, boolean isPublic);
    @Query(value = "SELECT IFNULL((SELECT SUM(taille) FROM document WHERE user=?1),0)", nativeQuery = true)
    long usedSpace(int id);
}
