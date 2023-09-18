package safezone.project.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import safezone.project.component.CommuDTO;
import safezone.project.mapper.CommuMapper;

@Service
public class CommuServiceImpl implements CommuService{
	@Autowired
	private CommuMapper mapper;
	
	@Override
	public void insertCommu(CommuDTO dto) {
		mapper.insertCommu(dto);
	}
	
	@Override
	public String[] uploadFiles(List<MultipartFile> fileList, String path) {
		String [] fileName = new String [3];
		int num=0;
		for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            String uuid = UUID.randomUUID().toString();
            String saveFileName = uuid + originFileName;

            String safeFile = path+saveFileName;
            System.out.println(safeFile);
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
            fileName[num]=saveFileName;
            num++;
        }
		return fileName;
	}
	
	
	@Override
	public List<CommuDTO> getCommu(CommuDTO dto){
		return mapper.getCommu(dto);
	}
}
