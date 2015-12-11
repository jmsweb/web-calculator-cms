package com.jms.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jms.web.service.Message;

@Controller
@RequestMapping
public class HomeController {
	
	@Autowired
	private Message message;
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.HEAD})
	public ModelAndView index(ModelAndView mav) {
		mav.setViewName("home/index");
		mav.addObject("message", message);
		return mav;
	}
}
