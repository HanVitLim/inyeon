package com.example.inyeon.main.mapper;

import com.example.inyeon.main.dto.VoucherDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface VoucherMapper {

    List<VoucherDTO> voucherSelectAll(VoucherDTO dto);
    List<VoucherDTO> voucherSelect(VoucherDTO dto);
    List<VoucherDTO> voucherSelect1(VoucherDTO dto);
    List<VoucherDTO> voucherSelect2(VoucherDTO dto);
    int voucherCount();

//    List<VoucherDTO> setSelectedSigngu(VoucherDTO dto);
}
