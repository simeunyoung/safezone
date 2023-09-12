package safezone.project.mapper;

import safezone.project.component.SafetyZoneDTO;
import safezone.project.component.UserDTO;

public interface UserMapper {

	public void insertUser(UserDTO dto);
	public String checkUser(String email);
}
