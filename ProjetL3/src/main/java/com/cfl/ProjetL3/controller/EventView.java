package com.cfl.ProjetL3.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cfl.ProjetL3.model.Event;
import com.cfl.ProjetL3.model.EventRepository;
import com.cfl.ProjetL3.model.Ticket;
import com.cfl.ProjetL3.model.User;

@Controller
public class EventView {

	private final EventRepository eventRepository;

	public EventView(EventRepository eventRepository) {this.eventRepository = eventRepository;}
	
	@GetMapping({"/event"})
	public String view(HttpSession session, ModelMap model, @RequestParam(required=false) Long id) {
		
		if(id == null) {
			//no id provided
			return "redirect:/";
		}
		
		Optional<Event> event = eventRepository.findById(id);
		if(event.isEmpty()) {
			//event with this id does not exists
			return "redirect:/";
		}

		model.addAttribute("event", event.get());
		return "event";
	}
	
	
	
	@PostMapping({"/event"})
	public String view(HttpSession session, ModelMap model, 
			@RequestParam Long id,
			@RequestParam Integer amount,
			@RequestParam String tarif,
			@RequestParam(required = false) String vip) {
		
		if(id == null || amount == null || tarif == null) {
			//missing parameters
			return "redirect:/";
		}
		
		if(amount < 1) {
			System.out.println("Ticket amount < 1 ! Forced to 1");
			amount = 1;
		}
		
		User user = (User)session.getAttribute("user");
		if(user == null) {
			//user not logged in
			return "redirect:/";
		}
		
		Optional<Event> opEvent = eventRepository.findById(id);
		if(opEvent.isEmpty()) {
			//event with this id does not exists
			return "redirect:/";
		}
		Event event = opEvent.get();
		
		boolean isVIP = vip != null && vip.equals("vip");
		Ticket ticket = new Ticket(user, event, amount, tarif, isVIP);
		
		List<Ticket> cart = (List<Ticket>) session.getAttribute("cart");
		if(cart == null) {
			cart = new ArrayList<Ticket>();
		}
		cart.add(ticket);
		session.setAttribute("cart", cart);
		
		model.addAttribute("event", event);
		return "event";
	}
}
