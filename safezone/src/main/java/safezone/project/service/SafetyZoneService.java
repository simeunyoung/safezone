package safezone.project.service;

import java.util.List;

import safezone.project.component.SafetyZoneDTO;

public interface SafetyZoneService {

	public void insertSafetyZone(SafetyZoneDTO dto);
	public List<SafetyZoneDTO> getSafeList(double minLat, double maxLat,double minLng,double maxLng);
	public List<SafetyZoneDTO> getList(double lat, double lon,double distance);
}
