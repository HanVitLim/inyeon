package com.example.inyeon.main.service;

import com.example.inyeon.main.dto.VoucherDTO;
import com.example.inyeon.main.mapper.VoucherMapper;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class VoucherServiceImpl implements VoucherService {

    private final VoucherMapper voucherMapper;
    Logger logger = LogManager.getLogger(this.getClass());


    @Override
    public List<VoucherDTO> voucherSelectAll(VoucherDTO dto) {
            logger.info("service 진입");
        return voucherMapper.voucherSelectAll(dto);
    }

    @Override
    public List<VoucherDTO> voucherSelect1(VoucherDTO dto){

        return voucherMapper.voucherSelect1(dto);
    }
    @Override
    public List<VoucherDTO> voucherSelect2(VoucherDTO dto){

        return voucherMapper.voucherSelect2(dto);
    }

//    @Override
//    public List<VoucherDTO> setSelectedSigngu(VoucherDTO dto){
//
//        return voucherMapper.setSelectedSigngu(dto);
//    }

    @Override
    public int voucherCount() {

        return voucherMapper.voucherCount();

    }

}
