package controller.forum;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadImageController {

	@RequestMapping("/forumjsp/imageUpload.forum")
	public String imageUpload(@RequestParam("upload") MultipartFile file,
			@RequestParam("CKEditorFuncNum") String CKEditorFuncNum, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		System.out.println("上傳IN");
		PrintWriter out = response.getWriter();
		String name = null;
		name = new String(file.getOriginalFilename().getBytes("iso-8859-1"), "UTF-8");
		String uploadContentType = file.getContentType();

		String expandedName = "";
		if (uploadContentType.equals("image/jpeg")) {
			expandedName = ".jpg";
		} else if (uploadContentType.equals("image/png")) {
			expandedName = ".png";
		} else if (uploadContentType.equals("image/gif")) {
			expandedName = ".gif";
		} else if (uploadContentType.equals("image/bmp")) {
			expandedName = ".bmp";
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",'',"
					+ "'文件格式不正確（必須為.jpg/.gif/.bmp/.png文件）');");
			out.println("</script>");
			return null;
		}

		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		name = df.format(new Date()) + expandedName;
		String DirectoryName = request.getContextPath() + "/images";
		System.out.println(DirectoryName);
		try {
			File file1 = new File(request.getServletContext().getRealPath("/images"), name);
			System.out.println(file1.getPath());
			file.transferTo(file1);

			File file2 = new File("C:/Maven/git/PCC/src/main/webapp/images/", name);
			file.transferTo(file1);
			file.transferTo(file2);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String fileURL = request.getContextPath() + "/images/" + name;

		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",'" + fileURL + "','')");
		out.println("</script>");
		out.close();
		return null;
	}

}
