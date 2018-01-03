package controller.login;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.api.client.*;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;

import model.bean.Member;
import model.bean.PointDetails;
import model.service.GoogleLoginService;
import model.service.MemberService;
import model.service.RegistyService;

@Controller
@SessionAttributes(names = { "member" })
public class googleLoginController {
	@Autowired
	private GoogleLoginService googleLoginService;
	@Autowired
	private RegistyService registyService;
	@Autowired
	private MemberService memberService;

	private static final String GOOGLE_CLIENT_ID = "368506092635-g2qmv1vf4gu9tbs24d644k0kgqqg79kr.apps.googleusercontent.com";

	@RequestMapping(path = { "/google.login" }, method = { RequestMethod.POST, RequestMethod.GET },produces= {"text/plain;charset=utf-8"})
	public @ResponseBody String method(String idtoken, Member member,PointDetails pointDetails,Model model) throws Exception {
//		System.out.println("test start");

		JacksonFactory jacksonFactory = new JacksonFactory();
		GoogleIdTokenVerifier googleIdTokenVerifier = new GoogleIdTokenVerifier(new NetHttpTransport(), jacksonFactory);

		GoogleIdToken token = GoogleIdToken.parse(jacksonFactory, idtoken);

		if (googleIdTokenVerifier.verify(token)) {
			GoogleIdToken.Payload payLoad = token.getPayload();
			if (!GOOGLE_CLIENT_ID.equals(payLoad.getAudience())) {
				throw new IllegalArgumentException("Audience mismatch");
			} else if (!GOOGLE_CLIENT_ID.equals(payLoad.getAuthorizedParty())) {
				throw new IllegalArgumentException("Client ID mismatch");
			}

			if (token != null) {
				Payload payload = token.getPayload();
//				System.out.println(payload);

				// Print user identifier
				String userId = payload.getSubject();
//				System.out.println("User ID: " + userId);

				// Get profile information from payload
				String email = payload.getEmail();
				boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
				String name = (String) payload.get("name");
				String pictureUrl = (String) payload.get("picture");
				String locale = (String) payload.get("locale");
				String familyName = (String) payload.get("family_name");
				String givenName = (String) payload.get("given_name");

				// Use or store profile information
				// ...

				Member mm = memberService.login(name, userId);

				if (mm == null) {
					member.setMemberId(name);
					member.setPassword(userId.getBytes());
					member.setName(familyName + givenName);
					member.setEmail(email);
					member.setRole(2);
					Member i = registyService.registy(member);
//					System.out.println("i=" + i);
//					Member bean = googleLoginService.update(member);
//					System.out.println("quick bean="+bean);
					model.addAttribute("member", i);
					pointDetails.setMemberId(member.getMemberId());
					registyService.insertMemberFirstTime(pointDetails);
					//寄信 給更改密碼成功
					String title="歡迎加入PCC會員";
					String body="<h2>親愛的  "+member.getMemberId()+" 會員 您好，感謝您加入Postnatal Care Center</h2>\r\n" + 
							"    <P style=\"line-height:26px;\">\r\n" + 
							"        PCC以滿懷喜悅、張開雙臂擁抱新生兒的母親，代表著希望與朝氣，也象徵新生兒的美好開始。\r\n" + 
							"    <br />\r\n" + 
							"    在這個美好的時刻，PCC團隊將秉持著 『 專業用心、待客如親 』 之精神，提供您全方位的照護、客製化的服務，打造最懂妳的產後護理之家，讓坐月子成為妳與寶寶最美好的蜜月之旅！\r\n" + 
							"    <br />\r\n" + 
							"        配對平台提供服務人員刊登資料，讓使用者有更多選擇，輕鬆找到適合幫忙坐月子的人員。\r\n" + 
							"    <br />\r\n" + 
							"        商城採用流暢的介面做商品的瀏覽、訂購，並提供多樣的搜尋方式。結帳採用第三方歐付寶線上付款或超商付款。\r\n" + 
							"    <br />\r\n" + 
							"        論壇有發文、回文、刪文、收藏、檢舉、依分類排序、輸入主題搜尋文章功能。\r\n" + 
							"    <br />\r\n" + 
							"        訂房專區可依需要的房型、價格做房間篩選，一鍵帶入功能自動填寫資料，也能使用會員點數折抵訂房金額，完成訂購後可獲得當次金額相應的點數。\r\n" + 
							"    <br />\r\n" + 
							"        課程中心顯示最新上架課程、報名人數百分比、依分類和輸入主題搜尋、網站後台可以自訂課程類型上架新課程\r\n" + 
							"    </p>\r\n" + 
							"    <br />\r\n" + 
							"    <a href='http://192.168.40.10:8080/PCC/index.jsp' style='background-color:#EB7C81;color:#fff;padding:10px;margin:10px 0px;text-decoration: none;'>前往PCC官方網站</a>\r\n" + 
							"    <br />\r\n" + 
							"    <h5>如有任何問題，歡迎透過官方網站查詢、或直接與我們聯繫<br/>(02) 6631 6666    /   thepccteam@gmail.com <br/>Postnatal Care Center 敬上</h5>";
					EmailUtil.sendEmail(email, title, body, null);
					
					return "正在註冊";
				} else {
					model.addAttribute("member", mm);
					return "已註冊";
				}

			}
			

		} else {
//			System.out.println("Invalid ID token.");
			throw new IllegalArgumentException("id token cannot be verified");
		}
		return null;
	}
	
	
	@RequestMapping(path="/quickRegisty.update.login",method= {RequestMethod.POST},produces= {"application/json;charset=utf-8"})
	public @ResponseBody Member method4(String phone,String area,String address,HttpSession session) {
		Member member= (Member)session.getAttribute("member");
//		id.getMemberId();
		member.setPhone(phone);
		member.setArea(area);
		member.setAddress(address);
//		System.out.println("quick 1 member="+member);
		if(member!=null) {
//			System.out.println("quick 2 member="+member);
			Member bean = googleLoginService.update(member);
//			System.out.println("quick bean="+bean);
			return member;
		}
		
		return null;
		
		
	}

}
