package com.apilizbox.repository;

import com.apilizbox.entity.PlanEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlanRepository extends JpaRepository<PlanEntity,String> {

}
