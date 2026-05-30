package com.bharatmesh.backend;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "sos_alerts")
public class SOSRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String location;
    private String message;
}