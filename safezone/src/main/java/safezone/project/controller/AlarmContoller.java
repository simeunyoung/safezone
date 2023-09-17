package safezone.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import safezone.project.service.AlarmService;


@Controller
public class AlarmContoller {

	@Autowired
	private AlarmService service;

	@RequestMapping("alarm")
	public String alarm() {

		return "/alarm/alarmList";
	}

}
