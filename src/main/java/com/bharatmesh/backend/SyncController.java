package com.bharatmesh.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/sync")
public class SyncController {

    @Autowired
    private SOSRepository sosRepository;

    @Autowired
    private BroadcastRepository broadcastRepository;

    @PostMapping("/sos")
    public ApiResponse syncSOS(@RequestBody List<SOSRequest> sosList) {
        sosRepository.saveAll(sosList);
        return new ApiResponse("success", sosList.size() + " SOS alerts synced!", null);
    }

    @PostMapping("/broadcast")
    public ApiResponse syncBroadcast(@RequestBody List<Broadcast> broadcasts) {
        broadcastRepository.saveAll(broadcasts);
        return new ApiResponse("success", broadcasts.size() + " broadcasts synced!", null);
    }
}