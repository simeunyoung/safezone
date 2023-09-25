package safezone.project.service;

import java.util.List;

import safezone.project.component.ApplyDTO;
import safezone.project.component.EmgbellDTO;
import safezone.project.component.RadiusDTO;

public interface ApplyService {
	public void applyInsert(ApplyDTO dto);
	public List<ApplyDTO> getApplyList();
	public String getApplyDate(String email);
}
