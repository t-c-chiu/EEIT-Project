package controller.shopping;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	

	// 前往商品頁面
	@RequestMapping(path = { "/productId.shopping" }, method = RequestMethod.GET)
	public String saveId(int productId, Model model) {
		System.out.println("跳跳 sse"+productId);
		if (productId != 0) {
			Product product = productService.search(productId);
			model.addAttribute("productPage", product);

		}
		return "page.product";
	}

	// 商品名搜尋頁面
	@RequestMapping(path = { "/searchProduct.shopping" }, method = RequestMethod.GET)
	public String searchProductFromSearchText(String searchText, Model model) {

		if (searchText != null && searchText.trim().length() != 0) {

			List<Product> products = productService.searchText(searchText);

			int page = 1;

			model.addAttribute("page", page);

			if (products != null && !products.isEmpty()) {
				model.addAttribute("products", products);
				model.addAttribute("page", page);
				return "page.productsearch";
			} else {
				model.addAttribute("searchResult0", "沒有相關產品");
				return "page.productsearch";
			}

		}

		model.addAttribute("searchResult0", "請輸入想要的產品");
		return "page.productsearch";
		// return null;
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
