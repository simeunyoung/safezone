package safezone.project.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import safezone.project.mapper.AlarmMapper;


@Service
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	private AlarmMapper mapper;
	
	
}
