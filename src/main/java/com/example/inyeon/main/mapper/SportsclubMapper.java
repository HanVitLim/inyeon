package com.example.inyeon.main.mapper;

import com.example.inyeon.main.dto.SportsclubDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SportsclubMapper {

    List<SportsclubDTO> sportsclubSelectAll(SportsclubDTO dto);
    List<SportsclubDTO> sportsclubSelect(SportsclubDTO dto);

    int sportsclubCount();

}
