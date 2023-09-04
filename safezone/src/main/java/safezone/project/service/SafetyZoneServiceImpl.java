package safezone.project.service;

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
}
