package com.bharatmesh.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserController {

    @Autowired
    private UserRepository userRepository;

    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @PostMapping("/register")
    public ApiResponse register(@RequestBody User user) {
        // Check karo email already exist toh nahi karta
        User existingUser = userRepository.findByEmail(user.getEmail());
        if (existingUser != null) {
            return new ApiResponse("error", "Email already registered!", null);
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return new ApiResponse("success", "User registered successfully", user.getName());
    }

    @PostMapping("/login")
    public ApiResponse login(@RequestBody User user) {
        User existingUser = userRepository.findByEmail(user.getEmail());

        if (existingUser == null) {
            return new ApiResponse("error", "User not found", null);
        }

        if (passwordEncoder.matches(user.getPassword(), existingUser.getPassword())) {
            String token = JwtUtil.generateToken(existingUser.getEmail());
            return new ApiResponse("success", "Login successful", token);
        } else {
            return new ApiResponse("error", "Invalid password", null);
        }
    }
}