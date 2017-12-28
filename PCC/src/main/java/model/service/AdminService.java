package model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Matching;
import model.bean.Member;
import model.bean.PostArticle;
import model.bean.ReportedArticle;
import model.bean.Servant;
import model.dao.MatchingDAO;
import model.dao.MemberDAO;
import model.dao.PostArticleDAO;
import model.dao.ReportedArticleDAO;
import model.dao.ReservationDAO;
import model.dao.ServantDAO;
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
	@Autowired
	private ReservationDAO reservationDAO;
	@Autowired
	private ServantDAO servantDAO;

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

	public String passMatching(Integer matchingId) {
		Matching matching = matchingDAO.selectByMatchingId(matchingId);
		for (Matching tempMatching : matchingDAO.selectByReservationId(matching.getReservationId())) {
			if (tempMatching.getStatus() == 1) {
				return "該申請人已有服務員";
			}
		}
		matching.setStatus(1);
		for (Matching temp2Matching : matchingDAO.selectByReservationIdAndNotMatchingId(matching.getReservationId(),
				matching.getMatchingId())) {
			temp2Matching.setStatus(3);
		}
		systemMessageDAO.insert(reservationDAO.selectMemberIdByReservationId(matching.getReservationId()), "配對結果通知",
				"您的申請已經通過審核，請等待您的服務員" + servantDAO.selectByServiceId(matching.getServiceId()).getName() + "跟您連絡。");
		return "審核成功，已發送訊息給申請人。";
	}

	public String refuseMatching(Integer matchingId, String reason, Integer recommend) {
		boolean isOKRecommend = false;
		for (Servant servant : servantDAO.selectServantList()) {
			if (servant.getServiceId() == recommend) {
				isOKRecommend = true;
				break;
			}
		}
		if (!isOKRecommend && recommend != 0) {
			return "無此服務員，請重新推薦。";
		}
		if (recommend == 0) {
			Matching matching = matchingDAO.selectByMatchingId(matchingId);
			matching.setStatus(2);
			systemMessageDAO.insert(reservationDAO.selectMemberIdByReservationId(matching.getReservationId()), "配對結果通知",
					reason);
		} else {
			Matching matching = matchingDAO.selectByMatchingId(matchingId);
			matching.setStatus(2);
			Servant servant = servantDAO.selectByServiceId(recommend);
			systemMessageDAO.insert(reservationDAO.selectMemberIdByReservationId(matching.getReservationId()), "配對結果通知",
					reason + "<br>推薦給您的服務員：" + "<br>服務員姓名：" + servant.getName() + "<br>服務經驗:：" + servant.getExperience()
							+ "年" + "<br>服務員介紹：" + servant.getIntroduction()
							+ "<br><br><img style='width:120px;height:120px;' src='/PCC/images/match/"
							+ servant.getServiceId() + ".jpg'>" + "<br><br><button class='chooseServant" + recommend
							+ "'>選擇此服務員</button>" + "<script>$('button').unbind();" + "$('.chooseServant" + recommend
							+ "').click(function(){" + "$.post('/PCC/chooseServant.match',{'serviceId':" + recommend
							+ "},function(data){" + "alert(data);" + "})" + "})</script>");
		}
		return "已拒絕該申請並發送訊息給申請人";
	}

	public List<Servant> giveMeServant() {
		return servantDAO.selectServantList();
	}

	public String deleteThisServant(Integer serviceId) {
		servantDAO.delete(servantDAO.selectByServiceId(serviceId));
		return "已刪除此服務員";
	}

	public Integer createServant(Servant servant) {
		return servantDAO.insert(servant);
	}

}
