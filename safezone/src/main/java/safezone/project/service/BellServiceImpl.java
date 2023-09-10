package safezone.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import safezone.project.mapper.EmgbellMapper;

@Service
public class BellServiceImpl implements BellService{
	
	@Autowired
	private EmgbellMapper mapper;
	
	@Value("${bellkey}")
    private String bellApiKey;
	
	
	
}
