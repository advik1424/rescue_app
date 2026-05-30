package com.bharatmesh.backend;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "women_sos")
public class WomenSOS {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String userName;
    private String location;
    private String contactNumber;
    private String status; // ACTIVE, RESOLVED
    private String evidenceUrl;
}