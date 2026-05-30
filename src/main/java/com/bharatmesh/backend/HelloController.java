package com.bharatmesh.backend;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class HelloController {

    @Autowired
    private SOSRepository sosRepository;

    @GetMapping("/hello")
    public String hello() {
        return "Bharat Mesh backend live hai!";
    }

    @PostMapping("/sos")
    public String triggerSOS(@RequestBody SOSRequest sos) {
        sosRepository.save(sos);
        return "SOS Saved! From: " + sos.getName() +
                " at " + sos.getLocation();
    }

    @GetMapping("/sos/all")
    public Object getAllSOS(@RequestHeader(value = "Authorization", required = false) String authHeader) {

        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            return "Access denied! Token required.";
        }

        String token = authHeader.substring(7);

        try {
            String email = JwtUtil.getEmailFromToken(token);
            return sosRepository.findAll();
        } catch (Exception e) {
            return "Invalid token!";
        }
    }
}