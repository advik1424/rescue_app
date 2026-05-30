package com.bharatmesh.backend;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "ambulance_requests")
public class AmbulanceRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String patientName;
    private String location;
    private String contactNumber;
    private String status; // PENDING, DISPATCHED, COMPLETED
}