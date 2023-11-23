package com.example.inyeon.main.service;

import com.example.inyeon.main.dto.VoucherDTO;

import java.util.List;

public interface VoucherService {
    List<VoucherDTO> voucherSelectAll(VoucherDTO dto);
    List<VoucherDTO> voucherSelect(VoucherDTO dto);
    List<VoucherDTO> voucherSelect1(VoucherDTO dto);
    List<VoucherDTO> voucherSelect2(VoucherDTO dto);
//    List<VoucherDTO> setSelectedSigngu(VoucherDTO dto);
    int voucherCount();

}
