package safezone.project.service;

import java.util.List;

import safezone.project.component.ApplyDTO;
import safezone.project.component.ApplyRecommendDTO;
import safezone.project.component.EmgbellDTO;
import safezone.project.component.RadiusDTO;

public interface ApplyService {
	public void applyInsert(ApplyDTO dto);
	public List<ApplyDTO> getApplyList();
	public String getApplyDate(String email);
	public void applyRecmdInsert(int applyNum, String memId);
	public void applyRecmdDelete(int applyNum, String memId);
	public int getRecommend(int applyNum);
	public List<ApplyRecommendDTO> getApplyRecmdList(String memId);
}
