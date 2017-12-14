package model.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dao.ClazzDAO;
import model.dao.StudentDAO;

@Service
@Transactional
public class ClazzService {

	@Autowired
	ClazzDAO clazzDAO;
	@Autowired
	StudentDAO studentDAO;
}
