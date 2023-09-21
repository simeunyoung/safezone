package safezone.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import safezone.project.component.EmgbellDTO;
import safezone.project.component.RadiusDTO;

public interface EmgbellMapper {
	public List<EmgbellDTO> getBell(RadiusDTO dto);
}
