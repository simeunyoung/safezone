package safezone.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import safezone.project.component.EmgbellDTO;
import safezone.project.component.RadiusDTO;
import safezone.project.service.BellService;

@Controller
@RequestMapping("/map")
public class EmgBellController {
	
	@Autowired
	private BellService service;
	
	@RequestMapping("/bell")
	public String bellMap() {
		return "/emgMap/emgMap";
	}
	
	@PostMapping("/bellLocation")
	public String setLocationMap(@RequestBody RadiusDTO dto, Model model) {
		dto.setDistance(0.5);
		System.out.println(dto.getLat()+ ", " +dto.getLon());
		
		List<EmgbellDTO> bellList=service.getBellList(dto);
		System.out.println(bellList.get(0).getLat());
		
		model.addAttribute("bellList", bellList);
		return "/emgMap/emgMap";
	}
	
}
