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
    private Logger logger = LogManager.getLogger(this.getClass());

    @Override
    public List<VoucherDTO> selectTest() {
            logger.info("service 진입");
        return voucherMapper.selectTest();
    }
}
