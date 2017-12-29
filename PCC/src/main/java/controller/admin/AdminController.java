package controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import model.bean.Member;
import model.bean.Servant;
import model.service.AdminService;
import model.service.MemberCenterService;

@Controller
@SessionAttributes({ "all", "listOfMatchingDetails", "worngMsg", "admin" })
public class AdminController {

	@Autowired
	private ServletContext application;
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberCenterService memberCenterService;

	@RequestMapping(path = "/adminLogin.admin", method = RequestMethod.POST)
	public String adminLogin(String memberId, String password, Model model, HttpServletResponse response) {
		Member admin = adminService.adminLogin(memberId, password);
		if (admin != null) {
			model.addAttribute("admin", admin);
			try {
				response.sendRedirect("/PCC/matching.admin");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		} else {
			model.addAttribute("worngMsg", "帳密輸入錯誤，請重新輸入。");
			return "adminLogin";
		}
	}

	@RequestMapping(path = "/article.admin", method = RequestMethod.GET)
	public String showArticleAdmin(Model model) {
		model.addAttribute("all", adminService.showArticleAdmin());
		return "article";
	}

	@RequestMapping(path = "/showReason.admin", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> showReason(Integer messageId, Integer reportId) {
		return adminService.showReason(messageId, reportId);
	}

	@RequestMapping(path = "/showReasons.admin", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> showReasons(Integer messageId) {
		return adminService.showReasons(messageId);
	}

	@RequestMapping(path = "/blackArticle.admin", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String blackArticle(Integer messageId) {
		return adminService.blackArticle(messageId);
	}

	@RequestMapping(path = "/showMyBePaidList.admin", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, Object> showMyBePaidList(@SessionAttribute("member") Member member) {
		return memberCenterService.showMyBePaidList(member.getMemberId());
	}

	@RequestMapping(path = "/checkOut.admin", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String checkOut(@SessionAttribute("member") Member member) {
		return memberCenterService.checkOut(member.getMemberId());
	}

	@RequestMapping(path = "/matching.admin", method = RequestMethod.GET)
	public String matchingAdmin(Model model) {
		model.addAttribute("listOfMatchingDetails", adminService.showMatchingAdmin());
		return "matching";
	}

	@RequestMapping(path = "/passMatching.admin", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String passMatching(Integer matchingId) {
		return adminService.passMatching(matchingId);
	}

	@RequestMapping(path = "/refuseMatching.admin", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String refuseMatching(Integer matchingId, String reason, Integer recommend) {
		return adminService.refuseMatching(matchingId, reason, recommend);
	}

	@RequestMapping(path = "/giveMeServant.admin", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Servant> giveMeServant() {
		return adminService.giveMeServant();
	}

	@RequestMapping(path = "/deleteThisServant.admin", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String deleteThisServant(Integer serviceId) {
		return adminService.deleteThisServant(serviceId);
	}

	@RequestMapping(path = "/adminLogout.admin", method = RequestMethod.GET)
	public String adminLogout(HttpSession session) {
		session.removeAttribute("admin");
		return "adminLogin";
	}

	@RequestMapping(path = "/createServant.admin", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String createServant(Servant servant, MultipartFile photo) {
		int serviceId = adminService.createServant(servant);
		String name = photo.getOriginalFilename();
		String mimeType = application.getMimeType(name);
		String expandedName = "";
		if (mimeType.equals("image/jpeg")) {
			expandedName = ".jpg";
		} else if (mimeType.equals("image/png")) {
			expandedName = ".png";
		} else if (mimeType.equals("image/gif")) {
			expandedName = ".gif";
		} else if (mimeType.equals("image/bmp")) {
			expandedName = ".bmp";
		}
		name = serviceId + expandedName;
		byte[] photoByte = new byte[(int) photo.getSize()];
		try {
			InputStream is = photo.getInputStream();
			is.read(photoByte);
			OutputStream os = new FileOutputStream(
					new File("C:\\Maven\\git\\PCC\\src\\main\\webapp\\images\\match", name));
			os.write(photoByte);
			os.close();
			photo.transferTo(new File(application.getRealPath("/images/match"), name));
		} catch (IOException e) {
			e.printStackTrace();
			return "新增失敗";
		}
		return "新增服務員成功，該服務員的編號為" + serviceId + "。";
	}
}
