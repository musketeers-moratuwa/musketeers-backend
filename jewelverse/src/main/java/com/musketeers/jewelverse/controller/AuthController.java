package com.musketeers.jewelverse.controller;

import com.musketeers.jewelverse.dto.request.LoginRequestDto;
import com.musketeers.jewelverse.dto.request.RegisterRequestDto;
import com.musketeers.jewelverse.dto.response.APIResponseDto;
import com.musketeers.jewelverse.dto.response.AuthResponseDto;
import com.musketeers.jewelverse.service.AuthService;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody RegisterRequestDto request) {
        return ResponseEntity.ok(authService.registerCustomer(request));
    }

    @PostMapping("/register-salesperson")
    public ResponseEntity<String> registerSalesperson(@RequestBody RegisterRequestDto request) {
        return ResponseEntity.ok(authService.registerCustomer(request));
    }

    @PostMapping("/login")
   public ResponseEntity<AuthResponseDto> login(@RequestBody LoginRequestDto request) {
        return ResponseEntity.ok(authService.login(request));
//        return ResponseEntity.ok("Hello login");
    }
}

