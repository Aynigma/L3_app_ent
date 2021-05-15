package com.cfl.ProjetL3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.cfl.ProjetL3.model.EventRepository;
import com.cfl.ProjetL3.model.User;
import com.cfl.ProjetL3.model.UserRepository;

@Controller
public class LoginView {

	private final UserRepository userRepository;

	public LoginView(UserRepository userRepository) {this.userRepository = userRepository;}
	
	@GetMapping({"/login"})
	public String view() {
		return "login";
	}
	
	@PostMapping({"/login"})
	public String view(HttpSession session, ModelMap model,
			@RequestParam(required=false) String username,
			@RequestParam(required=false) String password) {
		if(username == null || password == null) {
			model.addAttribute("error", "Tout les champs doivent être remplis.");
			return "login";
		}
		
		List<User> matchingUsers = userRepository.findByUsername(username);
		if(matchingUsers.size() < 1) {
			//user with this username does not exist
			model.addAttribute("error", "Pseudonyme invalide.");
			return "login";
		}
		
		User user = matchingUsers.get(0);
		
		if(!password.equals(user.getPassword())){
			//username and password missmatch
			model.addAttribute("error", "Mot de passe incorrect.");
			return "login";
		}
		
		session.setAttribute("user", user);
		return "redirect:/";
	}
	

	
	@GetMapping({"/logout"})
	public String view(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}









