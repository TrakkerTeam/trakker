package com.example.trakker;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import com.example.trakker.service.admin.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {

	@Autowired
	AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		// 총 이용자 수
		int memberTotalCount = adminService.memberCount();

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);



		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("memberTotalCount" , memberTotalCount);

		return "home";
	}


}
