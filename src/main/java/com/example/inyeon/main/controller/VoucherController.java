package com.example.inyeon.main.controller;

import com.example.inyeon.main.dto.SportsclubDTO;
import com.example.inyeon.main.dto.VoucherDTO;
import com.example.inyeon.main.service.VoucherService;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.inyeon.paging.Paging;

import java.util.List;
@Controller
@RequiredArgsConstructor
public class VoucherController {

    Logger logger = LogManager.getLogger(this.getClass());
    private final VoucherService voucherService;
    @GetMapping("/voucher")
    public String voucherSelectAll(VoucherDTO dto, Model m){

        int voucherCount = voucherService.voucherCount();
        Paging paging = new Paging();
        paging.setCri(dto);
        paging.setTotalCount(voucherCount - 10);
        List<VoucherDTO> list = voucherService.voucherSelectAll(dto);
        List<VoucherDTO> select = voucherService.voucherSelect1(dto);
        List<VoucherDTO> select2 = voucherService.voucherSelect2(dto);
//        List<VoucherDTO> setSelectedSigngu = voucherService.setSelectedSigngu(dto);

        m.addAttribute("select", select);
        m.addAttribute("select2", select2);
//        m.addAttribute("setSelectedSigngu", setSelectedSigngu);
        m.addAttribute("list",list);
        m.addAttribute("paging", paging);

        return "inVoucher";
    }

    @GetMapping("/voucherselect")
    public String voucherSelect(VoucherDTO dto, Model m){

        List<VoucherDTO> listS = voucherService.voucherSelect(dto);

        m.addAttribute("listS",listS);

        return "inVoucherSelect";
    }

    // 검색
    @GetMapping("/voucherSearch")
    public String voucherSearch(Model m, VoucherDTO dto) {
        logger.info("voucherSearch 진입 : ");
        logger.info(dto.getKeyword());
        logger.info(dto.getType());

        int voucherCount = voucherService.voucherCount();
        logger.info(voucherCount);

        int a = dto.getPage();
        logger.info("controller >>> " + a);

        Paging paging = new Paging();
        paging.setCri(dto);
        paging.setTotalCount(voucherCount);
        logger.info(dto.getPage());

        List<VoucherDTO> list = null;
        logger.info("list : " + list);

        list = voucherService.voucherSearch(dto);
        logger.info("list.size >> " + list.size());

        m.addAttribute("list", list);
        m.addAttribute("paging", paging);

        return "voucherSearch";
    }

}
