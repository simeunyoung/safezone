package safezone.project.mapper;

import org.apache.ibatis.annotations.Param;

import safezone.project.component.UserDTO;

public interface UserMapper {

	public void insertUser(UserDTO dto);
	public String checkUser(UserDTO dto);
	public String findEmail(UserDTO dto);
}
