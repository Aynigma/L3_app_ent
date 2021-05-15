package com.cfl.ProjetL3.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;


import com.cfl.ProjetL3.Util;
import com.cfl.ProjetL3.model.Event;
import com.cfl.ProjetL3.model.EventRepository;
import com.cfl.ProjetL3.model.Ticket;
import com.cfl.ProjetL3.model.TicketRepository;


@Controller
public class AdminView {

	private final EventRepository eventRepository;
	private final TicketRepository ticketRepository;
	
	public AdminView(EventRepository eventRepository, TicketRepository ticketRepository) {this.eventRepository = eventRepository; this.ticketRepository=ticketRepository;}
	
	@GetMapping({"/admin"})
	public String view(HttpSession session, ModelMap model) {

		//check if is logged admin
		if(!Util.isLoggedAdmin(session)) {
			return "redirect:/";
		}
		
		
		List<Event> events = eventRepository.findAll();
		List<Ticket> tickets = ticketRepository.findAll();
		
		int numberOfTicket = 0;
		float totalPrice = 0;
		for (Ticket ticket : tickets) {
			numberOfTicket += ticket.getAmount();
			totalPrice += ticket.getPrice();
		}
		
		
		model.addAttribute("numberOfEvents", events.size());
		model.addAttribute("numberOfTickets", numberOfTicket);
		model.addAttribute("totalPrice", totalPrice);
		
		
		
		
		return "admin";
	}
}
