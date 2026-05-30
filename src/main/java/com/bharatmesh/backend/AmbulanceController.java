package com.bharatmesh.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/ambulance")
public class AmbulanceController {

    @Autowired
    private AmbulanceRepository ambulanceRepository;

    @PostMapping("/request")
    public ApiResponse requestAmbulance(@RequestBody AmbulanceRequest request) {
        request.setStatus("PENDING");
        ambulanceRepository.save(request);
        return new ApiResponse("success", "Ambulance requested!", request);
    }

    @GetMapping("/all")
    public ApiResponse getAllRequests() {
        List<AmbulanceRequest> requests = ambulanceRepository.findAll();
        return new ApiResponse("success", "All requests", requests);
    }

    @PutMapping("/status/{id}")
    public ApiResponse updateStatus(@PathVariable Long id, @RequestParam String status) {
        AmbulanceRequest request = ambulanceRepository.findById(id).orElse(null);
        if (request == null) {
            return new ApiResponse("error", "Request not found", null);
        }
        request.setStatus(status);
        ambulanceRepository.save(request);
        return new ApiResponse("success", "Status updated!", request);
    }
}