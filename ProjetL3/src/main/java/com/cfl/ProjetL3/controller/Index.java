package com.cfl.ProjetL3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cfl.ProjetL3.model.Event;
import com.cfl.ProjetL3.model.EventRepository;
import com.cfl.ProjetL3.model.User;

@Controller
public class Index {
	
	private final EventRepository eventRepository;

	public Index(EventRepository eventRepository) {this.eventRepository = eventRepository;}
	
	
	@GetMapping({"/"})
	public String view(HttpSession session, ModelMap model, @RequestParam(required=false) String query) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("user", user);
		List<Event> events = eventRepository.findAll();
		
		//filter event by query
		if(query !=  null) {
			model.addAttribute("query", query);
			for (int i = events.size()-1; i >= 0; i--) {
				if(filterEvent(query.split(" "), events.get(i))) {
					events.remove(i);
				}
			}
		}
		
		model.addAttribute("ListEvent", events);
		return "home";
	}
	
	
	//return true if event is irrelevant to the query
	private boolean filterEvent(String[] query, Event event) {
		
		for (String string : query) {
			if(event.getName().contains(string)
					|| event.getTags().contains(string)
					|| event.getLocation().contains(string)
					|| event.getDate().toGMTString().contains(string)) {
				return false;
			}
		}
		
		return true;
	}
}
