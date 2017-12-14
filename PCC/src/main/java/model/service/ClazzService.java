package model.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.Clazz;
import model.dao.ClazzDAO;
import model.dao.StudentDAO;

@Service
@Transactional
public class ClazzService {

	@Autowired
	private ClazzDAO clazzDAO;
	@Autowired
	private StudentDAO studentDAO;

	public Integer addClass(Clazz clazz) {
		clazz.setStatus(0);
		return clazzDAO.insert(clazz);
	}
}
