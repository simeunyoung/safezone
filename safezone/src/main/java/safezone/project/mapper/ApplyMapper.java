package safezone.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import safezone.project.component.ApplyDTO;
import safezone.project.component.EmgbellDTO;
import safezone.project.component.RadiusDTO;

public interface ApplyMapper {
	public void applyInsert(ApplyDTO dto);
	public List<ApplyDTO> getApplyList();
	public String getApplyDate(String email);
}
