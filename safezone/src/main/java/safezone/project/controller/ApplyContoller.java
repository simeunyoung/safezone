package safezone.project.controller;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import safezone.project.component.ApplyDTO;
import safezone.project.component.ApplyRecommendDTO;
import safezone.project.service.AlarmService;
import safezone.project.service.ApplyService;


@Controller
public class ApplyContoller {

	@Autowired
	private ApplyService service;

	@RequestMapping("applyBoard")
	public String applyBoard(Model model,String message) {
		model.addAttribute("message",message);
		return "/apply/applyBoard";
	}
	
	@RequestMapping("applyInsert")
	public String applyInsert(ApplyDTO dto, Model model, String email) {
	    // service.getApplyDate(email)을 통해 작성일 문자열을 가져오는 코드
	    String applyDateString = service.getApplyDate(email);

	    if(applyDateString != null) {
	    	  // 현재 날짜를 가져오는 코드
		    Date currentDate = new Date();

		    // SimpleDateFormat을 사용하여 문자열을 Timestamp로 파싱
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    Timestamp applyDate = null;
		    try {
		        applyDate = new Timestamp(sdf.parse(applyDateString).getTime());
		    } catch (ParseException e) {
		        e.printStackTrace();
		        System.out.println("에러");
		    }

		    // 1년 전의 날짜를 계산
		    long oneYearInMillis = 365L * 24 * 60 * 60 * 1000; // 1년은 밀리초로 표현
		    long oneYearAgoMillis = currentDate.getTime() - oneYearInMillis;

		    // Timestamp를 Date로 변환하여 비교
		    Date applyDateAsDate = new Date(applyDate.getTime());
		    
		 // 작성일이 1년 이내에 있는지 확인
		    if (applyDateAsDate.after(new Date(oneYearAgoMillis))) {
		      
		        return "redirect:/applyBoard?message=1"; // 작성일이 1년 이내인 경우 applyBoard로 리다이렉트
		    } else {
		        service.applyInsert(dto);
		        return "redirect:/applyList"; // 작성일이 1년 이내가 아닌 경우 applyList로 리다이렉트
		    }
	    }else {
	    	service.applyInsert(dto);
	    	return "redirect:/applyList"; 
	    }

	}

	
	@RequestMapping("applyList")
	public String applyList(ApplyDTO dto, Model model,@RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "perPage", defaultValue = "10") int perPage,
            HttpSession session) {
		
		// 전체 목록 가져오기
	    List<ApplyDTO> allList = service.getApplyList();
	    
	    // 페이지 번호에 따라 목록 자르기
	    int totalItems = allList.size();
	    int totalPages = (int) Math.ceil((double) totalItems / perPage);
	    
	    // 현재 페이지가 1보다 작으면 1로 설정
	    if (page < 1) {
	        page = 1;
	    }
	    // 현재 페이지가 전체 페이지 수를 초과하면 마지막 페이지로 설정
	    if (page > totalPages) {
	        page = totalPages;
	    }
	    
	    int startIdx = (page - 1) * perPage;
	    int endIdx = Math.min(startIdx + perPage, totalItems);
	    
	    List<ApplyDTO> list = allList.subList(startIdx, endIdx);
	    
	    model.addAttribute("list", list);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page); // 현재 페이지 정보 추가
	    
	    
	    // 추천
	    String memId = (String)session.getAttribute("memId");
		List<ApplyRecommendDTO> recmdList = service.getApplyRecmdList(memId);
		 // recmdList를 JSON 문자열로 변환합니다.
	    ObjectMapper objectMapper = new ObjectMapper();
	    try {
			String recmdListJSON = objectMapper.writeValueAsString(recmdList);
			model.addAttribute("recmdList", recmdListJSON);
		} catch (JsonProcessingException e) {
		
			e.printStackTrace();
		}
		
		return "/apply/applyList";
	}
	
	@RequestMapping("applyRecommend")
	public @ResponseBody int applyRecommend(Integer applyNum, HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		service.applyRecmdInsert(applyNum,memId);
		int recommend = service.getRecommend(applyNum);
		return recommend;
	}
	
	@RequestMapping("cancelRecommend")
	public @ResponseBody int cancelRecommend(Integer applyNum, HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		service.applyRecmdDelete(applyNum,memId);
		int recommend = service.getRecommend(applyNum);
		return recommend;
	}

}
