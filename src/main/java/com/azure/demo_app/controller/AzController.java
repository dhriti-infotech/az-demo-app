package com.azure.demo_app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class AzController {

    private static final Logger log = LoggerFactory.getLogger(AzController.class);

    @GetMapping("/az/v1")
    public String checkHealth() {
        log.info("Inside checkHealth() method of AzController");
        return "Az Demo App is Up and Running using AKS";
    }
}
