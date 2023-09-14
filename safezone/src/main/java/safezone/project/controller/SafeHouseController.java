package safezone.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import safezone.project.component.EmgbellDTO;
import safezone.project.component.RadiusDTO;
import safezone.project.component.SafeHouseDTO;
import safezone.project.service.BellService;
import safezone.project.service.SafeHouseService;

@Controller
public class SafeHouseController {

	@Autowired
	private SafeHouseService service;
	
	@Autowired
	private BellService bellService;
	
	@RequestMapping("house")
	public String house() {
//		service.insert();
		return "/main";
	}
	
	@RequestMapping("haversine")
	// 주어진 지점과 경계 상자로부터 일정 반경(단위: km) 내의 위도와 경도 범위를 계산합니다.
    public @ResponseBody Map<String, Object> radius(double lat, double lon, Model model) {
		double distance = 0.5;
		List<SafeHouseDTO> list = service.getHouseList(lat, lon, distance);
		
		
		//Bell data import
		RadiusDTO dto = new RadiusDTO();
		dto.setLat(lat);
		dto.setLon(lon);
		dto.setDistance(distance);
		List<EmgbellDTO> bellList=bellService.getBellList(dto);
		
		Map<String, Object> data = new HashMap<>();
		data.put("SafeHouseDTO", list);
		data.put("EmgbellDTO", bellList);
		data.put("distance", distance);
		System.out.println(list.toString());
		System.out.println(bellList.toString());
        return data;
    }
}
