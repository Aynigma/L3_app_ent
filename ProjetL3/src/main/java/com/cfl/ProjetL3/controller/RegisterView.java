package com.cfl.ProjetL3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cfl.ProjetL3.model.User;
import com.cfl.ProjetL3.model.UserRepository;

@Controller
public class RegisterView {

	private final UserRepository userRepository;

	public RegisterView(UserRepository userRepository) {this.userRepository = userRepository;}
	
	
	@GetMapping({"/register"})
	public String view() {
		return "register";
	}
	
	
	@PostMapping({"/register"})
	public String view(HttpSession session, ModelMap model,
			@RequestParam String username,
			@RequestParam String password,
			@RequestParam String confpassword) {
		
		if(username == null || password == null || confpassword == null) {
			model.addAttribute("error", "Tout les champs doivent être remplis.");
			return "register";
		}
		
		if(!password.equals(confpassword)) {
			model.addAttribute("error", "Les mots de passes rentré doivent être les mêmes.");
			return "register";
		}
		
		List<User> matchingUsers = userRepository.findByUsername(username);
		if(matchingUsers.size() > 0) {
			//user with this username already exist
			model.addAttribute("error", "Pseudonyme indisponible.");
			return "register";
		}
		
		User user = new User(username, password, false);
		userRepository.save(user);
		session.setAttribute("user", user);
		return "redirect:/";
	}
	
}
