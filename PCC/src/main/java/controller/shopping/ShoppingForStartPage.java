package controller.shopping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.CategoryType;
import model.bean.Product;
import model.service.ProductService;
import spring.PrimitiveNumberEditor;

@Controller
@SessionAttributes(value= {"categorys","start","products","asideProducts"})
public class ShoppingForStartPage {
	
	@Autowired
	private ProductService productService;

	@InitBinder
	public void initlization(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));

	}
	
	@RequestMapping(path = {"/star.shopping"}, method = RequestMethod.POST)
	public String startCategory(String pageName, Model model) {
		//為了旁邊的分類欄選項
		List<CategoryType> categorys= productService.categoryFilter();
		//為了旁邊的新上市選項(狀態3)
		List<Product> products3= productService.hotProduct(3);
		//為了中間的熱銷選項(狀態2)
		List<Product> products= productService.hotProduct(2);

		//告訴頁面已經下載過了
		model.addAttribute("start", "lorded");
		//將搜尋到的東西擺入物件中傳送
		model.addAttribute("categorys", categorys);
		model.addAttribute("products",products);
		model.addAttribute("asideProducts", products3);
		if(pageName.equals("searchPage")) {
			return "page.productsearch";
		}else if(pageName.equals("prodcutPage")) {
		
			return "page.product";
		}
		return null;
	}
	
	@RequestMapping(path = {"/header.shopping"}, method = RequestMethod.GET,produces= {"application/json;utf-8"})
	public @ResponseBody List<CategoryType> headerCategory(String pageName, Model model){
		
		List<CategoryType> categorys= productService.categoryFilter();
		model.addAttribute("categorys", categorys);
		return categorys;
	}
	

}
