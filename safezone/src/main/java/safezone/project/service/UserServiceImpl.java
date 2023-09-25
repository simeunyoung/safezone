package safezone.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import safezone.project.component.UserDTO;
import safezone.project.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper mapper;

	public void insertUser(UserDTO dto) {
		mapper.insertUser(dto);
	};
	
	public String checkUser(UserDTO dto) {
		return mapper.checkUser(dto);
	}
	
	public String findEmail(UserDTO dto) {
		return mapper.findEmail(dto);
	}

}
