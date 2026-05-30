package com.bharatmesh.backend;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WomenSOSRepository extends JpaRepository<WomenSOS, Long> {
}