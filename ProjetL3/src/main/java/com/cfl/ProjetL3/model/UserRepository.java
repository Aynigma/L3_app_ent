package com.cfl.ProjetL3.model;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long>{

	public List<User> findByUsername(String username);
}
