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
import model.dao.SystemMessageDAO;

@Service
@Transactional
public class ClazzService {

	@Autowired
	private ClazzDAO clazzDAO;
	@Autowired
	private StudentDAO studentDAO;
	@Autowired
	private SystemMessageDAO systemMessageDAO;

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

	public List<Clazz> showAllClazzSimple() {
		return clazzDAO.selectAllClazz();
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

	public String beStudent(String memberId, Integer classId) {
		List<Integer> classIds = studentDAO.selectClassIdByMemberId(memberId);
		for (int cId : classIds) {
			if (cId == classId) {
				return "您已報名過此課程";
			}
		}
		Student student = new Student();
		student.setMemberId(memberId);
		student.setClassId(classId);
		student.setStatus(0);
		studentDAO.insert(student);
		Clazz clazz = clazzDAO.selectByClassId(classId);
		clazz.setCurrentStudents(clazz.getCurrentStudents() + 1);
		if (clazz.getCurrentStudents() == clazz.getNumberOfStudents()) {
			clazz.setStatus(1);
			List<String> memberIds = studentDAO.selectMemberIdByClassId(classId);
			for (String mId : memberIds) {
				String courseName = clazz.getCourseName();
				systemMessageDAO.insert(mId, courseName + "即將開課!!",
						"您報名的課程" + courseName + "將於" + clazz.getEndDate() + "開課，請在開課前繳費完畢。");
			}
		}
		return "報名成功";
	}

	public List<Object[]> showMyCourses(String memberId) {
		return studentDAO.selectClazzAndStudentByMemberId(memberId);
	}
}
