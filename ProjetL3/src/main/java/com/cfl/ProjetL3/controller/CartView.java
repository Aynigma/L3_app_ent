package com.cfl.ProjetL3.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cfl.ProjetL3.model.Ticket;
import com.cfl.ProjetL3.model.TicketRepository;
import com.cfl.ProjetL3.model.User;



@Controller
public class CartView {

	private final TicketRepository ticketRepository;
	
	public CartView(TicketRepository ticketRepository) {
		this.ticketRepository = ticketRepository;}
	
	@GetMapping({"/cart"})
	public String view(HttpSession session) {
		//check if a user is connected
		User user = (User)session.getAttribute("user");
		if(user == null || user.getIsAdmin()) {
			return "redirect:/";
		}
		return "cart";
	}
	
	
	@PostMapping({"/buycart"})
	public String view(HttpSession session, ModelMap model) {

		List<Ticket> cart = (List<Ticket>)session.getAttribute("cart");
		if(cart == null || cart.size() <= 0) {
			//cart is empty
			return "redirect:/cart";
		}
		
		//save all cart to database
		for (Ticket ticket : cart) {
			ticketRepository.save(ticket);
		}

		//empty cart
		session.setAttribute("cart", null);
		
		return "redirect:/cart";
	}
	
	
	@PostMapping({"/cancelticket"})
	public String view(HttpSession session, ModelMap model,
			@RequestParam Integer id) {
		//TODO
		if(id == null) {
			return "redirect:/cart";
		}
		
		List<Ticket> cart = (List<Ticket>)session.getAttribute("cart");
		if(cart == null || cart.size() <= 0) {
			//cart is empty
			return "redirect:/cart";
		}
		
		if(id < 0 || id >= cart.size()) {
			//out of bound
			return "redirect:/cart";
		}
		
		cart.remove((int)id);
		
		//save cart
		session.setAttribute("cart", cart);
		
		return "redirect:/cart";
	}
}



