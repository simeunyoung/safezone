package safezone.project.service;

import java.util.List;

import safezone.project.component.EmgbellDTO;
import safezone.project.component.RadiusDTO;

public interface BellService {
	public List<EmgbellDTO> getBellList(RadiusDTO dto);
	public EmgbellDTO getNearBell(RadiusDTO dto);
}
