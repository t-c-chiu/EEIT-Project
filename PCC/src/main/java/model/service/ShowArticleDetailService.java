package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShowArticleDetailService {
	
	@Autowired
	private PostArticleService postArticleService;
	@Autowired
	private ReplyArticleService replyArticleService;
	
}
