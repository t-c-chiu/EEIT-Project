package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.ProductBean;
import model.ProductService;
import spring.PrimitiveNumberEditor;

@Controller
@SessionAttributes({ "select", "bean", "msg" })
public class ProductController {

	@Autowired
	private ProductService productService;

	@InitBinder
	public void init(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}

	@RequestMapping("/pages/product.controller")
	public String doshit(String id, String prodaction, ProductBean bean, BindingResult bindingResult, Model model) {
		boolean showAll = true;

		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (bindingResult != null && bindingResult.hasErrors()) {
			if (bindingResult.getFieldError("id") != null) {
				errors.put("id", "ID必須是整數");
			}
			if (bindingResult.getFieldError("price") != null) {
				errors.put("price", "Price必須是數字");
			}
			if (bindingResult.getFieldError("expire") != null) {
				errors.put("expire", "Expire必須必須是數字");
			}
			if (bindingResult.getFieldError("make") != null) {
				errors.put("make", "Make必須必須是日期");
			}
		}

		if ("Insert".equals(prodaction) || "Update".equals(prodaction) || "Delete".equals(prodaction)) {
			if (id == null || id.trim().length() == 0) {
				errors.put("id", "請輸入ID以執行" + prodaction);
			}
		}

		if (errors != null && !errors.isEmpty()) {
			return "prod.err";
		}

		switch (prodaction) {
		case "Select":
			List<Object[]> result = productService.select(bean);
			if (result == null) {
				errors.put("id", "你要搜尋的帳號不存在");
				break;
			}
			showAll = false;
			model.addAttribute("select", result);
			return "prod.ok";
		case "Insert":
			bean = productService.insert(bean);
			if (bean == null) {
				errors.put("id", "此帳號已存在");
				break;
			}
			model.addAttribute("bean", bean);
			model.addAttribute("msg", "您已成功新增一筆資料");
			break;
		case "Update":
			bean = productService.update(bean);
			if (bean == null) {
				errors.put("id", "你要更新的帳號不存在");
				break;
			}
			model.addAttribute("bean", bean);
			model.addAttribute("msg", "您已成功更新一筆資料");
			break;
		case "Delete":
			List<Object[]> tmpBeans = productService.select(bean);
			if (tmpBeans == null || tmpBeans.isEmpty()) {
				errors.put("id", "你要刪除的帳號不存在");
				break;
			}
			ProductBean deletedBean = new ProductBean();
			deletedBean.setId((int) tmpBeans.get(0)[0]);
			deletedBean.setName((String) tmpBeans.get(0)[1]);
			deletedBean.setPrice((double) tmpBeans.get(0)[2]);
			deletedBean.setMake((java.util.Date) tmpBeans.get(0)[3]);
			deletedBean.setExpire((int) tmpBeans.get(0)[4]);

			productService.delete(bean);
			model.addAttribute("bean", deletedBean);
			model.addAttribute("msg", "您已成功刪除一筆資料");
			break;
		default:
			model.addAttribute("msg", "未知的選項:" + prodaction);
			break;
		}

		if (errors != null && !errors.isEmpty()) {

			return "prod.err";
		}
		if (showAll) {
			List<Object[]> result = productService.select(null);
			model.addAttribute("select", result);
			return "prod.ok";
		}
		return null;
	}
}
