package com.example.inyeon.main.controller;

import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class maintest {

    private Logger logger = LogManager.getLogger(maintest.class);

    @GetMapping("/main")
    public String test(){

        logger.info("test!!! >>>> ");
        return "hello";
    }

}
