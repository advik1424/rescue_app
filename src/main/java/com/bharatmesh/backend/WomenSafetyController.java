package com.bharatmesh.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/women")
public class WomenSafetyController {

    @Autowired
    private WomenSOSRepository womenSOSRepository;

    @PostMapping("/sos")
    public ApiResponse triggerSOS(@RequestBody WomenSOS sos) {
        sos.setStatus("ACTIVE");
        womenSOSRepository.save(sos);
        return new ApiResponse("success", "SOS Triggered! Help is coming!", sos);
    }

    @PostMapping("/journey")
    public ApiResponse startJourney(@RequestBody WomenSOS journey) {
        journey.setStatus("JOURNEY_ACTIVE");
        womenSOSRepository.save(journey);
        return new ApiResponse("success", "Journey Watch Started!", journey);
    }

    @GetMapping("/evidence")
    public ApiResponse getEvidence() {
        List<WomenSOS> evidence = womenSOSRepository.findAll();
        return new ApiResponse("success", "Evidence fetched!", evidence);
    }
}