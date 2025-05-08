package com.musketeers.jewelverse.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/customer")
public class UserController {
    @GetMapping("/message1")
    public ResponseEntity<String> message() {
        return ResponseEntity.ok("Hello from UserController");
    }

    @GetMapping("/message2")
    public ResponseEntity<String> message2() {
        return ResponseEntity.ok("Hello from UserController2");
    }
}
