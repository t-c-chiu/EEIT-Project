package model.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.Clazz;
import model.bean.Student;
import model.dao.ClazzDAO;
import model.dao.StudentDAO;

@Service
@Transactional
public class ClazzService {

	@Autowired
	private ClazzDAO clazzDAO;
	@Autowired
	private StudentDAO studentDAO;

	public Map<String, Object> showAllClazz() {
		List<String> listOfCategory = clazzDAO.selectAllCategory();
		List<Clazz> listOfClazz = clazzDAO.selectAllClazz();
		List<Clazz> listOfClosestCourse = clazzDAO.selectAllClazz();
		Collections.sort(listOfClosestCourse, new Comparator<Clazz>() {
			@Override
			public int compare(Clazz c1, Clazz c2) {
				double ratio1 = (double) c1.getCurrentStudents() / (double) c1.getNumberOfStudents();
				double ratio2 = (double) c2.getCurrentStudents() / (double) c2.getNumberOfStudents();
				if (ratio1 > ratio2) {
					return -1;
				} else if (ratio1 < ratio2) {
					return 1;
				} else {
					return 0;
				}
			}
		});
		Map<String, Object> clazzInfo = new HashMap<>();
		clazzInfo.put("listOfCategory", listOfCategory);
		clazzInfo.put("listOfClazz", listOfClazz);
		clazzInfo.put("listOfClosestCourse", listOfClosestCourse);
		return clazzInfo;
	}

	public Clazz showClazzById(Integer classId) {
		return clazzDAO.selectByClassId(classId);
	}

	public List<Clazz> showClazzByCategory(String category) {
		return clazzDAO.selectByCategory(category);
	}

	public Integer addClass(Clazz clazz) {
		clazz.setStartDate(new Date());
		clazz.setStatus(0);
		clazz.setCurrentStudents(0);
		clazz.setIntroduction(clazz.getIntroduction().substring(1));
		return clazzDAO.insert(clazz);
	}

	public Integer beStudent(String memberId, Integer classId) {
		Student student =new Student();
		student.setMemberId(memberId);
		student.setClassId(classId);
		student.setStatus(0);
		return studentDAO.insert(student);
	}
}
