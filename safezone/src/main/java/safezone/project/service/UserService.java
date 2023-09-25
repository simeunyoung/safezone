package safezone.project.service;

import safezone.project.component.SafetyZoneDTO;
import safezone.project.component.UserDTO;

public interface UserService {

	public void insertUser(UserDTO dto);
	public String checkUser(UserDTO dto);
	public String findEmail(UserDTO dto);
	//public String findPw(UserDTO dto);
}