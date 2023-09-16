package safezone.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import safezone.project.component.CommuDTO;
import safezone.project.mapper.CommuMapper;

@Service
public class CommuServiceImpl implements CommuService{
	@Autowired
	private CommuMapper mapper;
	
	@Override
	public void insertCommu(CommuDTO dto) {
		mapper.insertCommu(dto);
	}
}
