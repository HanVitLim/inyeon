package com.example.inyeon.main.controller;

import com.example.inyeon.main.dto.SportsclubDTO;
import com.example.inyeon.main.service.SportsclubService;
import com.example.inyeon.paging.Paging;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class SportsclubController {

    Logger logger = LogManager.getLogger(this.getClass());
    private final SportsclubService sportsclubService;

    // 전체 조회
    @GetMapping("/sportsclub")
    public String sportsclubSelectAll(SportsclubDTO dto, Model m){

        int sportsclubCount = sportsclubService.sportsclubCount();
        logger.info(sportsclubCount);

        Paging paging = new Paging();
        paging.setCri(dto);
        paging.setTotalCount(sportsclubCount);
        logger.info(dto.getPage());
        List<SportsclubDTO> sportsclubselectAll = sportsclubService.sportsclubSelectAll(dto);

        m.addAttribute("sportsclub", sportsclubselectAll);
        m.addAttribute("paging", paging);

        return "sportsclubSelectAll";
    }

    // 조건 조회
    @GetMapping("/sportsclubSelect")
    public String sportsclubSelect(SportsclubDTO dto, Model m) {
        logger.info("sportsclubSelect 진입 : ");
        logger.info(dto.getClub_nm());

        List<SportsclubDTO> list = sportsclubService.sportsclubSelect(dto);
        logger.info("list : " + list);
        logger.info("list.size()" + list.size());

        if (list.size() == 1) {
            logger.info("sportsclubSelect list.size() : " + list.size());

            m.addAttribute("list", list);
            return "sportsclubSelect";
        }else{
            logger.info("실패");
        }
        return "sportsclubSelectAll";
    }

    // 검색
    @GetMapping("/clubSearch")
    public String clubSearch(Model m, SportsclubDTO dto) {
        logger.info("clubSearch 진입 : ");
        logger.info(dto.getKeyword());
        logger.info(dto.getType());

        List<SportsclubDTO> list = null;
        logger.info("list : " + list);

        list = sportsclubService.clubSearch(dto);

        m.addAttribute("list", list);

        return "clubSearch";
    }
}
