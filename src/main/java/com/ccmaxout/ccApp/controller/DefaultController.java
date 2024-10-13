package com.ccmaxout.ccApp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DefaultController {
    @GetMapping("/welcome")
    public String welcome(){
        return "{ \"application-name\" : \"CC-MaxOut\" }";
    }
}
