package safezone.project.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import safezone.project.component.CommuDTO;

public interface CommuService {
	public void insertCommu(CommuDTO dto);
	public String[] uploadFiles(List<MultipartFile> fileList, String path);
	public List<CommuDTO> getCommu(CommuDTO dto);
}
