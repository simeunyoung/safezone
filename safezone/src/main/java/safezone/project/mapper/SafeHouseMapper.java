package safezone.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import safezone.project.compoent.SafeHouseDTO;

public interface SafeHouseMapper {

	public void insert(SafeHouseDTO safeHouse);
	public List<SafeHouseDTO> getHouseList(@Param("minLat") double minLat, @Param("maxLat") double maxLat, @Param("minLng") double minLng, @Param("maxLng") double maxLng);
}
