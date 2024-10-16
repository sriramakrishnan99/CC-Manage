package com.ccmaxout.ccApp.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DefaultController {
    @GetMapping("/")
    public String welcome(){
        return "{ \"application-name\" : \"cc-max-out-api\" }";
    }
}
