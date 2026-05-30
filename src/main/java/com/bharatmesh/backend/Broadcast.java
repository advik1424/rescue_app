package com.bharatmesh.backend;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "broadcasts")
public class Broadcast {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String senderName;
    private String message;
    private String area;
    private String type; // EMERGENCY, NEWS, RESOURCE, SAFETY
}