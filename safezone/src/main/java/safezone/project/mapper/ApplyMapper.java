package safezone.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import safezone.project.component.ApplyDTO;
import safezone.project.component.ApplyRecommendDTO;
import safezone.project.component.EmgbellDTO;
import safezone.project.component.RadiusDTO;

public interface ApplyMapper {
	public void applyInsert(ApplyDTO dto);
	public List<ApplyDTO> getApplyList();
	public String getApplyDate(String email);
	public void applyRecmdInsert(@Param("applyNum") int applyNum, @Param("memId") String memId);
	public void applyRecmdDelete(@Param("applyNum") int applyNum, @Param("memId") String memId);
	public List<ApplyRecommendDTO> getApplyRecmdList(String memId);
	public void applyRecmdUp(int applyNum);
	public void applyRecmdDown(int applyNum);
	public int getRecommend(int applyNum);
}
