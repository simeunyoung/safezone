package safezone.project.mapper;

import java.util.List;

import safezone.project.component.CommuDTO;

public interface CommuMapper {
	public void insertCommu(CommuDTO dto);
	public List<CommuDTO> getCommu(CommuDTO dto);
}
