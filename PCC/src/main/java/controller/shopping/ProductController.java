package controller.shopping;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Product;
import model.service.ProductService;
import spring.PrimitiveNumberEditor;

@Controller
@SessionAttributes(value = { "products", "productPage", "adminProduct", "categoryName" })
public class ProductController {

	@Autowired
	private ProductService productService;


	@InitBinder
	public void initlization(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));

	}
	//利用價錢來搜尋
	@RequestMapping(path = { "/searchByPrice.shopping" }, method = RequestMethod.GET)
	public String searchByPrice(int lowPrice,int hightPrice, Model model,HttpSession session) {

		if (hightPrice!= 0) {

			List<Product> products = productService.selectByPrice(lowPrice, hightPrice);

			int page = 1;

			model.addAttribute("page", page);
			model.addAttribute("products", products);
			if (products == null || products.isEmpty()) {
				session.removeAttribute("products");
			} 
				

		}

		model.addAttribute("searchResult0", "請輸入想要的產品");
		return "page.productsearch";
		
	}
	
	
	
	//autocomplete
	@RequestMapping(path = { "/autocomplete.shopping" }, method = RequestMethod.GET, produces= {"application/json;charset=UTF-8"})
	public @ResponseBody List<String> autocomplete(String searchText, Model model) {
		List<String> listName=new ArrayList<String>();
		if (searchText != null && searchText.trim().length() != 0) {
			List<Product> products = productService.searchText(searchText);
			for(Product p :products) {
				listName.add(p.getProductName());
			}	
		}
		return listName;
	}	

	// 前往商品頁面-1
	@RequestMapping(path = { "/productId.shopping" }, method = RequestMethod.GET)
	public String goToPage(int productId, Model model) {
		if (productId != 0) {
			Product product = productService.search(productId);
			model.addAttribute("productPage", product);
		}
		return "page.product";
	}
	
	// 前往商品頁面-2
	@RequestMapping(path = { "/center.shopping" }, method = RequestMethod.GET, produces= {"text/plain;charset=UTF-8"})
	public @ResponseBody String goToPageFromCenter(int productId, Model model) {
		if (productId != 0) {
			Product product = productService.search(productId);
			model.addAttribute("productPage", product);
		}
		return "請前往";
	}
	
	
	

	// 商品名搜尋頁面
	@RequestMapping(path = { "/searchProduct.shopping" }, method = RequestMethod.GET)
	public String searchProductFromSearchText(String searchText, Model model,HttpSession session) {

		if (searchText != null && searchText.trim().length() != 0) {

			List<Product> products = productService.searchText(searchText);

			int page = 1;

			model.addAttribute("page", page);
			model.addAttribute("products", products);
			if (products == null || products.isEmpty()) {
				session.removeAttribute("products");
			} 
				

		}

		model.addAttribute("searchResult0", "請輸入想要的產品");
		return "page.productsearch";
		
	}

	// 商品利用分頁搜尋頁面
	@RequestMapping(path = { "/searchCatagory.shopping" }, method = RequestMethod.GET)
	public String searchProductFromSearchCategory(String category, Model model) {

		if (category != null && category.trim().length() != 0) {

			List<Product> products = productService.searchByCategory(category);

			int page = 1;

			model.addAttribute("page", page);

			if (products != null && !products.isEmpty()) {
				// List<Product> page8 = null;
				model.addAttribute("products", products);
				model.addAttribute("page", page);
				model.addAttribute("categoryName", category);
				return "page.productsearch";

			} else {

				model.addAttribute("searchResult0", "沒有相關產品");
				return "page.productsearch";

			}

		}

		model.addAttribute("searchResult0", "請輸入想要的產品");
		return "page.productsearch";

	}

	// 未完成想轉換頁面
	@RequestMapping(path = { "/pageChange.shopping" }, method = RequestMethod.GET

	)
	public String nextOrPrevious(String nextORprevious) {

		return null;
	}


}
