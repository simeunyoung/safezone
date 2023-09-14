package safezone.project.service;

import java.util.List;

import safezone.project.component.SafeHouseDTO;

public interface SafeHouseService {

	public void insert();
	public List<SafeHouseDTO> getHouseList(double latitude, double longitude, double distance);
}
