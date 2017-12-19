package model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.bean.PostArticle;
import model.bean.ReportedArticle;
import model.dao.MemberDAO;
import model.dao.PostArticleDAO;
import model.dao.ReportedArticleDAO;

@Service
@Transactional
public class AdminService {

	@Autowired
	private PostArticleDAO postArticleDAO;
	@Autowired
	private ReportedArticleDAO reportedArticleDAO;
	@Autowired
	private MemberDAO memberDAO;

	public Map<String, Object> showArticleAdmin() {
		List<ReportedArticle> listOfReportedArticlesDetail = reportedArticleDAO.selectMessageIdByStatus(0);
		List<Object[]> listOfDetail = new ArrayList<>();
		for (ReportedArticle rArticle : listOfReportedArticlesDetail) {
			Object[] misc = { postArticleDAO.selectByMessageId(rArticle.getMessageId()), rArticle };
			listOfDetail.add(misc);
		}
		List<PostArticle> listOfReportedArticles = postArticleDAO.selectByStatus(1);
		List<Object[]> listOfReportedInfo = new ArrayList<>();
		for (PostArticle pArticle : listOfReportedArticles) {
			Object[] misc = { pArticle, reportedArticleDAO.selectCountByMessageId(pArticle.getMessageId()) };
			listOfReportedInfo.add(misc);
		}
		List<Member> listOfBlackMembers = memberDAO.selectMemberByStatus(1);
		Map<String, Object> all = new HashMap<>();
		all.put("listOfDetail", listOfDetail);
		all.put("listOfReportedInfo", listOfReportedInfo);
		all.put("listOfBlackMembers", listOfBlackMembers);
		return all;
	}

	public Map<String, Object> showReason(Integer messageId, Integer reportId) {
		ReportedArticle reportedArticle = reportedArticleDAO.selectByReportId(reportId);
		reportedArticle.setStatus(1);
		Map<String, Object> map = new HashMap<>();
		map.put("postArticle", postArticleDAO.selectByMessageId(messageId));
		map.put("reason", reportedArticle.getReason());
		return map;
	}

	public Map<String, Object> showReasons(Integer messageId) {
		PostArticle postArticle = postArticleDAO.selectByMessageId(messageId);
		List<ReportedArticle> listOfReportedArticle = reportedArticleDAO.selectByMessageId(messageId);
		List<String> reasons = new ArrayList<>();
		for (ReportedArticle article : listOfReportedArticle) {
			reasons.add(article.getReason());
		}
		Map<String, Object> map = new HashMap<>();
		map.put("postArticle", postArticle);
		map.put("reasons", reasons);
		return map;
	}

	public Member blackMember(Integer messageId, boolean isBlack) {
		Member member = memberDAO.select(postArticleDAO.selectByMessageId(messageId).getMemberId());
		postArticleDAO.selectByMessageId(messageId).setStatus(2);
		if (isBlack) {
			if (member.getStatus() == 1) {
				return null;
			}
			member.setStatus(1);
			return member;
		}
		return null;
	}
}
