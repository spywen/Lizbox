package com.apilizbox.controller.api;

import com.apilizbox.business.PlanBusiness;
import com.apilizbox.entity.PlanEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
/**
 * Created by youcef on 20/02/14.
 */
@Controller
@RequestMapping("/api/plans")
public class PlanController {
    @Resource
    PlanBusiness planBusiness;

    /**
     * Méthode de récupération de la liste des plans
     * @return
     */
    @Transactional
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<PlanEntity> findAll(){
        return planBusiness.findAll();
    }
}