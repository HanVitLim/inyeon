package com.example.inyeon.main.controller;

import com.example.inyeon.main.dto.SportsclassDTO;
import com.example.inyeon.main.service.SportsclassService;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.inyeon.paging.Paging;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class SportsclassController {

    private final SportsclassService sportsclassService;
    Logger logger = LogManager.getLogger(this.getClass());

    @GetMapping("/sportsclass")
    public String sportsclassSelectAll(SportsclassDTO dto,Model m){

        int sportsclassCount = sportsclassService.sportsclassCount();
        logger.info(sportsclassCount);

        Paging paging = new Paging();
        paging.setCri(dto);
        paging.setTotalCount(sportsclassCount - 10);
        logger.info(dto.getPage());
        List<SportsclassDTO> list = sportsclassService.sportsclassSelectAll(dto);

        m.addAttribute("list",list);
        m.addAttribute("paging", paging);

        return "sportsclassView";
    };

}
