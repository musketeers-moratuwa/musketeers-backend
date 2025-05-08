package com.musketeers.jewelverse.entity;

import com.musketeers.jewelverse.enums.Role;
import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(unique = true)
    private String email;

    private String password;

//    @Enumerated(EnumType.STRING)
    private Role role = Role.CUSTOMER;
}