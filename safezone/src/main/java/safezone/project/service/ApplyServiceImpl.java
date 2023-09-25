package safezone.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import safezone.project.component.ApplyDTO;
import safezone.project.mapper.AlarmMapper;
import safezone.project.mapper.ApplyMapper;


@Service
public class ApplyServiceImpl implements ApplyService{
	
	@Autowired
	private ApplyMapper mapper;
	
	public void applyInsert(ApplyDTO dto) {
		mapper.applyInsert(dto);
	}
	
	public List<ApplyDTO> getApplyList(){
		return mapper.getApplyList();
	}
	
	public String getApplyDate(String email) {
		return mapper.getApplyDate(email);
	}
}
