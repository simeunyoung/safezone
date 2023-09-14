package safezone.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import safezone.project.component.SafeHouseDTO;
import safezone.project.service.HaversineDAO;
import safezone.project.service.SafeHouseService;

@Controller
public class SafeHouseController {

	@Autowired
	private SafeHouseService service;
	
	@RequestMapping("house")
	public String house() {
//		service.insert();
		return "/main";
	}
	
	@RequestMapping("haversine")
	// 주어진 지점과 경계 상자로부터 일정 반경(단위: km) 내의 위도와 경도 범위를 계산합니다.
    public @ResponseBody List<SafeHouseDTO> radius(double lat, double lon, Model model) {
		double distance = 3;
		List<SafeHouseDTO> list = service.getHouseList(lat, lon, distance);
		System.out.println(list.toString());
        return list;
    }
}
