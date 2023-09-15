package safezone.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import safezone.project.component.EmgbellDTO;
import safezone.project.component.RadiusDTO;
import safezone.project.service.BellService;
import safezone.project.service.SafeHouseService;

@Controller
@RequestMapping("/map")
public class EmgBellController {
	
	@Autowired
	private SafeHouseService service;
	
	@Autowired
	private BellService bellService;
	
	@RequestMapping("/bell")
	public String bellMap() {
		return "/emgMap/emgMap";
	}
	@RequestMapping("/road")
	public String roadMap() {
		return "/emgMap/findRoad";
	}
	
	
	
	@PostMapping("/bellLocation")
	public String setLocationMap(@RequestBody RadiusDTO dto, Model model) {
		dto.setDistance(0.5);
		System.out.println(dto.getLat()+ ", " +dto.getLon());
		
		List<EmgbellDTO> bellList=bellService.getBellList(dto);
		System.out.println(bellList.get(0).getLat());
		
		model.addAttribute("bellList", bellList);
		return "/emgMap/emgMap";
	}
	
	@PostMapping("/sendLo")
	public ResponseEntity<double[]> setLocationRoad(@RequestBody RadiusDTO dto) {
		dto.setDistance(0.5);
		EmgbellDTO bellDTO =bellService.getNearBell(dto);
		
		
		System.out.println(dto.toString());
		System.out.println(bellDTO.toString());
		double arr[] = new double [2];
		arr[0] = bellDTO.getX();
		arr[1] = bellDTO.getY();
		
		
		return ResponseEntity.ok(arr);
	}
	
}
