package safezone.project.service;

import java.util.List;

import safezone.project.compoent.SafeHouseDTO;

public interface SafeHouseService {

	public void insert();
	public List<SafeHouseDTO> getHouseList(double latitude, double longitude);
}
