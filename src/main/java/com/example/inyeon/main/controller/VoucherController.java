package com.example.inyeon.main.controller;

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

}
