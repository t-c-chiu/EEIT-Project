package model.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import model.bean.PostArticle;
import model.dao.PostArticleDAO;

@Service
@Transactional
public class PostArticleService {

	@Autowired
	PostArticleDAO postArticleDAO;

	public int postArticle(PostArticle bean, MultipartFile photo) {
		int messageId = postArticleDAO.insert(bean);
		if (messageId == -1) {
			return messageId;
		}
		String type = photo.getContentType().substring(photo.getContentType().indexOf("/")).replace("/", ".");
		System.out.println(type);
//		try {
//			photo.transferTo(new File(messageId + type));
//			return messageId;
//		} catch (IllegalStateException | IOException e1) {
//			e1.printStackTrace();
			return -1;
//		}
	}
}
