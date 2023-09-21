package safezone.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import safezone.project.component.SafetyZoneDTO;
import safezone.project.mapper.SafetyZoneMapper;

@Service
public class SafetyZoneServiceImpl implements SafetyZoneService{
	
	@Autowired
	private SafetyZoneMapper mapper;
	
	public void insertSafetyZone(SafetyZoneDTO dto) {
		mapper.insertSafetyZone(dto);
	};
	
	public List<SafetyZoneDTO> getSafeList(double minLat, double maxLat,double minLng,double maxLng) {
		return mapper.getSafeList(minLat, maxLat, minLng, maxLng);
	};
	
	public List<SafetyZoneDTO> getList(double lat, double lon,double distance){
		return mapper.getList(lat,lon,distance);
	};
}
