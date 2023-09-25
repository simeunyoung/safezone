package safezone.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import safezone.project.component.SafetyZoneDTO;

public interface SafetyZoneMapper {

	public void insertSafetyZone(SafetyZoneDTO dto);
	public List<SafetyZoneDTO> getSafeList(@Param("minLat")double minLat, @Param("maxLat")double maxLat, @Param("minLng")double minLng, @Param("maxLng")double maxLng);
	public List<SafetyZoneDTO> getList(@Param("lat")double lat,@Param("lon") double lon,@Param("distance") double distance);
}
