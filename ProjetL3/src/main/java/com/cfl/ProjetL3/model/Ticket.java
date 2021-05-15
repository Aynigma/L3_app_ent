package com.cfl.ProjetL3.model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Ticket implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@OneToOne
	private User owner;

	@ManyToOne
	private Event event;

	@Column(nullable = false)
	private Integer amount;

	@Column(nullable = false)
	private String type;
	
	@Column(nullable = false)
	private Boolean isVIP;


	/* Constructors */
	protected Ticket() {
	}

	public Ticket(User owner, Event event, Integer amount, String type, Boolean isVIP) {
		this.owner = owner;
		this.event = event;
		this.amount = amount;
		this.type = type;
		this.isVIP = isVIP;
	}

	/* Getters Setters */

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Boolean getIsVIP() {
		return isVIP;
	}

	public void setVIP(Boolean isVIP) {
		this.isVIP = isVIP;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public float getPrice() {
		float price = event.getPrice();
		float totalPrice = 0;
		
		switch (type) {
		case "tarif-child":
			totalPrice += price * Event.tariffChildMultiplier;
			break;
		case "tarif-young":
			totalPrice += price * Event.tariffYoungMultiplier;
			break;
		case "tarif-senior":
			totalPrice += price * Event.tariffSeniorMultiplier;
			break;
		default:
			totalPrice += price;
			break;
		}

		if(isVIP) {
			totalPrice *= Event.tariffVIPMultiplier;
		}
		
		totalPrice *= amount;
		totalPrice = Math.round(totalPrice*100)/100;
		
		return totalPrice;
	}

	public String getFormatedType() {
		String formatedType = "Normal";
		switch (type) {
		case "tarif-child":
			formatedType = "Enfant";
			break;
		case "tarif-young":
			formatedType = "Jeune";
			break;
		case "tarif-senior":
			formatedType = "Senior";
			break;
		default:
			break;
		}
		return formatedType;
	}
	
	
}
