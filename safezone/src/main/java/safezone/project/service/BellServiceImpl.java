package safezone.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import safezone.project.component.EmgbellDTO;
import safezone.project.component.RadiusDTO;
import safezone.project.mapper.EmgbellMapper;

@Service
public class BellServiceImpl implements BellService{
	
	@Autowired
	private EmgbellMapper mapper;
	
	@Value("${bellkey}")
    private String bellApiKey;
	
	public List<EmgbellDTO> getBellList(RadiusDTO dto){
		return mapper.getBell(dto);
	}
	
	public EmgbellDTO getNearBell(RadiusDTO dto) {
		return mapper.getNearBell(dto);
	}
	
	
}
