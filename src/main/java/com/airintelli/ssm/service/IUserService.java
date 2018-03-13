package com.airintelli.ssm.service;

import java.util.List;

import com.airintelli.ssm.pojo.User;

public interface IUserService {

	List<User> findAll();
	
	void add(User user);
	
	User findById(Integer id);
	
	void update(User user);
	
	void delete(Integer id);
}
