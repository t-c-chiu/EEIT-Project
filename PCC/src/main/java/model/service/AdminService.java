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
import model.dao.MatchingDAO;
import model.dao.MemberDAO;
import model.dao.PostArticleDAO;
import model.dao.ReportedArticleDAO;
import model.dao.SystemMessageDAO;

@Service
@Transactional
public class AdminService {

	@Autowired
	private PostArticleDAO postArticleDAO;
	@Autowired
	private ReportedArticleDAO reportedArticleDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private SystemMessageDAO systemMessageDAO;
	@Autowired
	private MatchingDAO matchingDAO;

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
		List<PostArticle> listOfBlackArticles = postArticleDAO.selectByStatus(2);
		List<Member> listOfBlackMembers = memberDAO.selectMemberByStatus(1);
		Map<String, Object> all = new HashMap<>();
		all.put("listOfDetail", listOfDetail);
		all.put("listOfReportedInfo", listOfReportedInfo);
		all.put("listOfBlackArticles", listOfBlackArticles);
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

	public String blackArticle(Integer messageId) {
		PostArticle postArticle = postArticleDAO.selectByMessageId(messageId);
		String memberId = postArticle.getMemberId();
		postArticle.setStatus(2);
		Integer countOfStatus2 = postArticleDAO.selectCountOfStatus2(memberId);
		if (countOfStatus2 == 2) {
			memberDAO.select(memberId).setStatus(1);
			systemMessageDAO.insert(memberId, "你已被加入討論區黑名單", "由於你的文章經常被檢舉且經審核後已被封鎖兩篇，系統將限制你在討論區的發文。");
			return "已將" + postArticle.getTopic() + "封鎖, " + memberId + "被封鎖文章到達兩篇, 已被加入黑名單";
		}
		return "已將" + postArticle.getTopic() + "封鎖";
	}

	public List<Object[]> showMatchingAdmin() {
		return matchingDAO.selectMatchingDetailsByStatus0();
	}

}
