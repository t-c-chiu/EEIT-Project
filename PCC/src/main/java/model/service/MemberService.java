package model.service;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.dao.MemberDAO;

@Service
@Transactional
public class MemberService {
	@Autowired
	private MemberDAO memberDao;

	public Member login(String memberId, String password) {
		Member bean = memberDao.select(memberId);
		// bean檢查完不是null就進入
		if (bean != null) {
			// 再檢查password，不是null就進入
				// 資料庫的password
				byte[] psd = bean.getPassword();
				// 使用者輸入的password
				byte[] temp = password.getBytes();
				// 相等的話就回傳bean
				if (Arrays.equals(psd, temp)) {
					return bean;
				}
			
		}
		// bean是null就回傳null
		return null;
	}

}
