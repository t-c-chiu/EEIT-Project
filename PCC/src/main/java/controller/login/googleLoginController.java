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
	public @ResponseBody String method(String idtoken, Member member,Model model) throws Exception {
		System.out.println("test start");

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
				System.out.println(payload);

				// Print user identifier
				String userId = payload.getSubject();
				System.out.println("User ID: " + userId);

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
					member.setRole(1);
					Member i = registyService.registy(member);
					System.out.println("i=" + i);
//					Member bean = googleLoginService.update(member);
//					System.out.println("quick bean="+bean);
					model.addAttribute("member", i);
					return "正在註冊";
				} else {
					model.addAttribute("member", mm);
					return "已註冊";
				}

			}
			

		} else {
			System.out.println("Invalid ID token.");
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
