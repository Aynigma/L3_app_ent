package com.cfl.ProjetL3.controller;

import java.util.Date;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cfl.ProjetL3.Util;
import com.cfl.ProjetL3.model.Event;
import com.cfl.ProjetL3.model.EventRepository;


@Controller
public class EventEditorView {
	
	private final EventRepository eventRepository;
	
	public EventEditorView(EventRepository eventRepository) {this.eventRepository = eventRepository;}
	
	@GetMapping({"/admin/editevent"})
	public String view(HttpSession session, ModelMap model,
			@RequestParam(required=false) Long id) {
		
		if(!Util.isLoggedAdmin(session)) {return "redirect:/";}
		
		Event defaultEvent = new Event("", "", new Date(), "", "", "", 1f, false, false, false, false);
		
		if(id == null) {
			//no id provided
			model.addAttribute("event", defaultEvent);
			return "editEvent";
		}
		
		Optional<Event> event = eventRepository.findById(id);
			
		if(event.isEmpty()) {
			//no id matching
			model.addAttribute("event", model.addAttribute("event", defaultEvent));
			return "editEvent";
		}
		
		model.addAttribute("event", event.get());
		return "editEvent";
	}
	
	@PostMapping({"/admin/editevent"})
	public String view(HttpSession session, ModelMap model,
			@RequestParam(required=false) Long id,
			@RequestParam(required=false) String name,
			@RequestParam(required=false) String subtitle,
			@RequestParam(required=false) String location,
			@RequestParam(required=false) String date,
			@RequestParam(required=false) String description,
			@RequestParam(required=false) String tags,
			@RequestParam(required=false) Float price,
			@RequestParam(required=false) String tariff_child,
			@RequestParam(required=false) String tariff_young,
			@RequestParam(required=false) String tariff_senior,
			@RequestParam(required=false) String tariff_vip) {
		
		
		boolean isTariffChild = (tariff_child != null && tariff_child.equals("tariff_child"));
		boolean isTariffYoung = (tariff_young != null && tariff_young.equals("tariff_young"));
		boolean isTariffSenior = (tariff_senior != null && tariff_senior.equals("tariff_senior"));
		boolean isTariffVIP = (tariff_vip != null && tariff_vip.equals("tariff_vip"));
		//System.out.println("Child"+isTariffChild+"\nYoung"+isTariffYoung+"\nSenior"+isTariffSenior+"\nVIP"+isTariffVIP);
		
		if(id == null) {
			//no id provided, creating a new event
			System.out.println("No id provided, creating a new event");
			Event event = new Event(name, location, Util.parseHTMLDate(date), subtitle, description,
					tags, price, isTariffChild, isTariffYoung, isTariffSenior, isTariffVIP);
			eventRepository.save(event);
			return "redirect:/admin";
		}
		
		if(name == null || subtitle == null || location == null || date == null || description == null || tags == null || price == null) {
			System.out.println("A null argument has been found:"+name+"\n"+subtitle+"\n"+location+"\n"+date+"\n"+description+"\n"+tags+"\n"+price);
			return "redirect:/admin";
		}
		
		
		
		Optional<Event> opEvent = eventRepository.findById(id);
		if(opEvent.isEmpty()) {
			//no id matching
			return "redirect:/admin";
		}
		
		Event event = opEvent.get();
		event.setName(name);
		event.setSubtitle(subtitle);
		event.setLocation(location);
		event.setDate(Util.parseHTMLDate(date));
		event.setDescription(description);
		event.setTags(tags);
		event.setPrice(price);
		event.setTariffChildAvailable(isTariffChild);
		event.setTariffYoungAvailable(isTariffYoung);
		event.setTariffSeniorAvailable(isTariffSenior);
		event.setTariffVIPAvailable(isTariffVIP);
		eventRepository.save(event);
		
		return "redirect:/admin";
	}
	
	
	@GetMapping({"/admin/deleteevent"})
	public String view(HttpSession session, 
			@RequestParam Long id) {
		
		if(!Util.isLoggedAdmin(session)) {return "redirect:/";}
		
		if(id == null) {
			//no id provided
			return "redirect:/admin";
		}
		
		eventRepository.deleteById(id);
		
		//delete the event
		return "redirect:/";
	}
}




