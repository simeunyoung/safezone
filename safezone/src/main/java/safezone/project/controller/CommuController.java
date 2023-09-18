package safezone.project.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import safezone.project.component.CommuDTO;
import safezone.project.service.CommuService;

@Controller
@RequestMapping("/community")
public class CommuController {
	
	@Autowired
	private CommuService service;
	
	@RequestMapping("/home")
	public String commuHome(CommuDTO dto, Model model) {
	    List<CommuDTO> allCommu = service.getCommu(dto);

	    int pageNum = dto.getPageNum();
	    int itemsPerPage = 10;

	    int totalPages = (int) Math.ceil((double) allCommu.size() / itemsPerPage);

	    List<CommuDTO> commuCut = allCommu.subList((pageNum - 1) * itemsPerPage, Math.min(pageNum * itemsPerPage, allCommu.size()));

	    model.addAttribute("totalCount", allCommu.size());
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("commuCut", commuCut);
	    model.addAttribute("dto", dto);
		return "/community/commuList";
	}
	
	@RequestMapping("/form")
	public String commuForm(CommuDTO dto, Model model, HttpServletRequest request) {
		if(dto.getCommu_num()>0) {
			List<CommuDTO> modelDTO = service.getCommu(dto);
			model.addAttribute("dto", modelDTO.get(0));
			model.addAttribute("path", request.getRealPath("/WEB-INF/files/"));
		}
		
		return "/community/commuWrite";
	}
	
	@RequestMapping("/content")
	public String commuContent(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		CommuDTO dto = new CommuDTO();
		dto.setCommu_num(num);
		List<CommuDTO> modelDTO = service.getCommu(dto);
		
		if(modelDTO.size()>0) {
			model.addAttribute("dto", modelDTO.get(0));
			model.addAttribute("path", request.getRealPath("safezoneImgFiles/"));
		}
		return "/community/commuContent";
	}
	
	@RequestMapping("/submitForm")
	public String submitForm(MultipartHttpServletRequest multipartRequest, CommuDTO dto) {
		String [] fileName = new String [3];
		try {
            multipartRequest.setCharacterEncoding("utf-8");
            List<MultipartFile> fileList = multipartRequest.getFiles("file[]");
            String path = multipartRequest.getSession().getServletContext().getRealPath("safezoneImgFiles/");
//            String path = multipartRequest.getSession().getServletContext().getRealPath("safezoneImgFiles/");
            
            if(fileList.get(0).getSize()>0 || (fileList.size()>1 && fileList.size()<4)) {
            	fileName=service.uploadFiles(fileList, path);
            }

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
		
		dto.setImg1(fileName[0]);
		dto.setImg2(fileName[1]);
		dto.setImg3(fileName[2]);

		System.out.println(dto.toString());
		service.insertCommu(dto);
		
		return "redirect:/community/commuList";
	}
}
