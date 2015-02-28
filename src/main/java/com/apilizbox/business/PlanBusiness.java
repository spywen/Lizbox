package com.apilizbox.business;

import com.apilizbox.entity.PlanEntity;
import com.apilizbox.repository.PlanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by youcef on 20/02/14.
 */
@Service
public class PlanBusiness {
    @Autowired
    PlanRepository planRepository;

    /**
     * Récupère l'ensemble des plans disponibles (OFFRES)
     * @return
     */
    public List<PlanEntity> findAll(){
        return planRepository.findAll();
    }

}
