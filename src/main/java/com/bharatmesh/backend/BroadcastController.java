package com.bharatmesh.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/broadcast")
public class BroadcastController {

    @Autowired
    private BroadcastRepository broadcastRepository;

    @PostMapping("/send")
    public ApiResponse sendBroadcast(@RequestBody Broadcast broadcast) {
        broadcastRepository.save(broadcast);
        return new ApiResponse("success", "Broadcast sent to " + broadcast.getArea(), broadcast);
    }

    @GetMapping("/all")
    public ApiResponse getAllBroadcasts() {
        List<Broadcast> broadcasts = broadcastRepository.findAll();
        return new ApiResponse("success", "All broadcasts", broadcasts);
    }
}