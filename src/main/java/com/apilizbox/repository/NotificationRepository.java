package com.apilizbox.repository;

import com.apilizbox.entity.NotificationEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by laurent on 15/02/2014.
 */
public interface NotificationRepository extends JpaRepository<NotificationEntity,Integer> {
    List<NotificationEntity> findByUtilisateurOrderByDateDesc(int id);
    List<NotificationEntity> findByUtilisateurAndLectureIsNullOrderByDateDesc(int id);
    List<NotificationEntity> findByUtilisateurAndLectureIsNotNullOrderByDateDesc(int id);
    List<NotificationEntity> findByUtilisateurOrderByDateDesc(int id, Pageable pageable);
    List<NotificationEntity> findByUtilisateurAndLectureIsNullOrderByDateDesc(int id, Pageable pageable);
    List<NotificationEntity> findByUtilisateurAndLectureIsNotNullOrderByDateDesc(int id, Pageable pageable);
}
