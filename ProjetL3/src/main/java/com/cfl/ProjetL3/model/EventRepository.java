package com.cfl.ProjetL3.model;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface EventRepository extends CrudRepository<Event, Long>{
	
	List<Event> findAll();
}
