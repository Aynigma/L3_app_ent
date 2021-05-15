package com.cfl.ProjetL3.model;

import java.util.Date;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.persistence.*;

@Entity
public class Event implements Serializable {

	public static final float tariffChildMultiplier = .5f;
	public static final float tariffYoungMultiplier = .75f;
	public static final float tariffSeniorMultiplier = .7f;
	public static final float tariffVIPMultiplier = 1.5f;
	
	
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
	
    @Column(nullable = false)
	private String name;
    
    @Column(nullable = false)
	private String location;
    
    @Column(nullable = false)
	private Date date;
    
    @Column(nullable = false)
    private String subtitle;
    
    @Column(nullable = false, length = 1024)
    private String description;
    
    @Column(nullable = false)
    private String tags;
	
	@Column(nullable = false)
    private Float price;
	
	@Column(nullable = false)
	private Boolean tariffChildAvailable;
	
	@Column(nullable = false)
	private Boolean tariffYoungAvailable;
	
	@Column(nullable = false)
	private Boolean tariffSeniorAvailable;
	
	@Column(nullable = false)
	private Boolean tariffVIPAvailable;
    
	/* Constructors */
	protected Event() {}
	
	public Event(String name, String location, Date date, String subtitle,
			String description, String tags, Float price, Boolean tariffChildAvailable,
			Boolean tariffYoungAvailable, Boolean tariffSeniorAvailable, Boolean tariffVIPAvailable) {
		this.name = name;
		this.location = location;
		this.date = date;
		this.subtitle = subtitle;
		this.description = description;
		this.tags = tags;
		this.price = price;
		
		this.tariffChildAvailable = tariffChildAvailable;
		this.tariffYoungAvailable = tariffYoungAvailable;
		this.tariffSeniorAvailable = tariffSeniorAvailable;
		this.tariffVIPAvailable = tariffVIPAvailable;
		
	}

	
	/* Getters Setters */
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Long getId() {
		return id;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Boolean getTariffChildAvailable() {
		return tariffChildAvailable;
	}

	public void setTariffChildAvailable(Boolean tariffChildAvailable) {
		this.tariffChildAvailable = tariffChildAvailable;
	}

	public Boolean getTariffYoungAvailable() {
		return tariffYoungAvailable;
	}

	public void setTariffYoungAvailable(Boolean tariffYoungAvailable) {
		this.tariffYoungAvailable = tariffYoungAvailable;
	}

	public Boolean getTariffSeniorAvailable() {
		return tariffSeniorAvailable;
	}

	public void setTariffSeniorAvailable(Boolean tariffSeniorAvailable) {
		this.tariffSeniorAvailable = tariffSeniorAvailable;
	}

	public Boolean getTariffVIPAvailable() {
		return tariffVIPAvailable;
	}

	public void setTariffVIPAvailable(Boolean tariffVIPAvailable) {
		this.tariffVIPAvailable = tariffVIPAvailable;
	}

	public String toString() {
		return getName();
	}
	
	public String getFormatedDate() {
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		return formatter.format(this.date);
	}
	
	public String getFormatedDateValue() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		return formatter.format(this.date);
	}
}
