package safezone.project.controller;

import java.util.ArrayList;
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
import safezone.project.component.SafetyZoneDTO;
import safezone.project.service.BellService;
import safezone.project.service.SafeHouseService;
import safezone.project.service.SafetyZoneService;

@Controller
public class SafeHouseController {

	@Autowired
	private SafeHouseService service;
	
	@Autowired
	private BellService bellService;
	
	@Autowired
	private SafetyZoneService zoneService;
	
	@RequestMapping("house")
	public String house() {
//		service.insert();
		return "/main";
	}
	
	@RequestMapping("haversine")
	public @ResponseBody Map<String, Object> radius(double lat, double lon, Model model) {
	    Map<String, Object> data = new HashMap<>();
	    List<SafeHouseDTO> list = new ArrayList<>();
	    List<EmgbellDTO> bellList = new ArrayList<>();
	    List<SafetyZoneDTO> zonelist = new ArrayList<>();

	    double distance = 0.1;

	    while (true) {
	        RadiusDTO dto = new RadiusDTO();
	        dto.setLat(lat);
	        dto.setLon(lon);
	        dto.setDistance(distance);

	        list = service.getHouseList(lat, lon, distance);
	        bellList = bellService.getBellList(dto);
	        zonelist = zoneService.getList(lat, lon, distance);

	        if (!list.isEmpty() || !bellList.isEmpty() || !zonelist.isEmpty()) {
	            // 하나라도 리스트가 비어 있지 않다면 반복문을 종료합니다.
	            break;
	        }

	        distance += 0.1;
	    }

	    data.put("SafeHouseDTO", list);
	    data.put("EmgbellDTO", bellList);
	    data.put("SafetyZoneDTO", zonelist);
	    data.put("distance", distance);

	    System.out.println(list.toString());
	    System.out.println(bellList.toString());
	    System.out.println(zonelist.toString());
	    return data;
	}
}
