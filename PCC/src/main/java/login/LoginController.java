package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;

@WebServlet("/glogin.controller")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = -6622112648495251701L;

	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");

		try {
			String idToken = request.getParameter("id_token");
			GoogleIdToken.Payload payLoad = IdTokenVerifierAndParser.getPayload(idToken);
			String name = (String) payLoad.get("name");
			String email = payLoad.getEmail();
			String picture = (String) payLoad.get("picture");
			/*
			 * System.out.println("User name: " + name); System.out.println("User email: " +
			 * email); System.out.println("Picture URL: " + picture);
			 */
			System.out.println(email);
			HttpSession session = request.getSession(true);
			session.setAttribute("userName", name);
			session.setAttribute("email", email);
			session.setAttribute("picture", picture);
			session.setAttribute("login_time", new java.util.Date(System.currentTimeMillis()));
			request.getRequestDispatcher("welcome.jsp").forward(request, resp);

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
