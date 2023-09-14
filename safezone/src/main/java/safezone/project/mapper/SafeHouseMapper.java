package safezone.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import safezone.project.component.SafeHouseDTO;

public interface SafeHouseMapper {

	public void insert(SafeHouseDTO safeHouse);
	public List<SafeHouseDTO> getHouseList(@Param("latitude") double latitude, @Param("longitude") double longitude, @Param("distance") double distance);
}
