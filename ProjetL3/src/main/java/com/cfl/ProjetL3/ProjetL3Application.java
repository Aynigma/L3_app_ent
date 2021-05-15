package com.cfl.ProjetL3;

import java.util.Date;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cfl.ProjetL3.model.Event;
import com.cfl.ProjetL3.model.EventRepository;
import com.cfl.ProjetL3.model.Ticket;
import com.cfl.ProjetL3.model.TicketRepository;
import com.cfl.ProjetL3.model.User;
import com.cfl.ProjetL3.model.UserRepository;



@SpringBootApplication
public class ProjetL3Application extends SpringBootServletInitializer {

	private static ApplicationContext context;
	
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ProjetL3Application.class);
    }
	
	
	public static void main(String[] args) {
		context = SpringApplication.run(ProjetL3Application.class, args);
		//init();
	}
	
	
	
	public static void init() {
		
		
		UserRepository ur = context.getBean(UserRepository.class);
		User user = new User("user", "user", false);
		User user1 = new User("user1", "user1", false);
		User user2 = new User("user2", "user2", false);
		User admin = new User("admin", "admin", true);
		User admin1 = new User("admin1", "admin1", true);
		ur.save(user);
		ur.save(user1);
		ur.save(user2);
		ur.save(admin);
		ur.save(admin1);
		
		EventRepository er = context.getBean(EventRepository.class);
		Event event = new Event("Health and Happiness Workshop", "En ligne", new Date("05/31/2021"), 
				"Experiencing Stress? Anxiety? Worries? Health issues?\nLearn effortless techniques to manage your stress and increase your energy levels",
				"The pandemic environment, personal problems and work pressure take a toll on our body and mind. The Art of Living brings you this free "
				+ "holistic and integrated workshop called the Health and Happiness which provide unique tools and techniques which help combat stress"
				+ " accumulated in our daily, modern life.\n"
				+ "Through breathing techniques and meditation taught in this workshop one feels light, energetic and enthusiastic to take on life!",
				"En ligne, Santé, Stress", 0f, false, false, false, false);
		Event event1 = new Event("Self-Care and Wellness", "En ligne", new Date("06/10/2021"),
				"Presentation will focus on understanding how stress affects you (the psychological, spiritual, interpersonal and physical impacts).",
				"This two-hour presentation will focus on understanding how stress affects you (the psychological, spiritual, interpersonal and physical impacts)\n"
				+ "learning strategies to help you manage stress more effectively and to build resiliency\n"
				+ "virtual practice of the different strategies to manage stress and practice self-care and wellness\n"
				+ "and available resources and how to connect.",
				"En ligne, Santé, Stress, Bien-être", 5.0f, true, true, true, false);
		Event event2 = new Event("La Foire de Tours", "Tours (37)", new Date("07/02/2021"),
				"Succès confirmé pour la Foire de Tours 2019, avec 347 744 entrées. Des visiteurs séduits par la qualité de ce rendez-vous incontournable.\n"
				+ "Chaque année, plus de 625 professionnels de tous les secteurs d'activité sont présents au Parc Expo de Tours.",
				"La Foire de Tours : un espace commercial, convivial et festif, le plus grand rendez-vous de la région pour rencontrer des professionnels"
				+ " dans de nombreux secteurs d’activités, découvrir de nouveaux produits ou services.\nPlus de 625 exposants sont présents pour vous pendant 10 jours.\n"
				+ "Ils vous invitent à découvrir les innovations, tester, comparer de très nombreux produits, à profiter de leurs conseils de spécialistes et de leurs offres commerciales.\n"
				+ "La Foire de Tours, le rendez-vous incontournable d'octobre. C’est la plus grande “vitrine commerciale“ de la région, 10 jours d’échanges,"
				+ " de découvertes, de démonstrations, d’animations, de rencontres, de dégustations…\n"
				+ "45 500m² de bons plans et de nouveautés dans de nombreux secteurs.\n",
				"Foire, Exposition", 30f, true, false, true, true);
		er.save(event);
		er.save(event1);
		er.save(event2);
		
		
		TicketRepository tr = context.getBean(TicketRepository.class);
		Ticket ticket = new Ticket(user, event2, 2, "tarif-default", false);
		Ticket ticket1 = new Ticket(user, event2, 3, "tarif-child", false);
		Ticket ticket2 = new Ticket(user, event2, 1, "tarif-senior", true);
		
		tr.save(ticket);
		tr.save(ticket1);
		tr.save(ticket2);
		
		
		
		
		
		System.out.println("Spring Boot Done");
		
		
		List<Event> events = er.findAll();
		for(Event e : events) {
			System.out.println(e.getId()+ " -> " + e.getName());
		}

	}
	
	
	public static ApplicationContext getContext() {
		return context;
	}
	

	
}



