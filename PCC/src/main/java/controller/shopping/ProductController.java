package controller.shopping;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
@SessionAttributes(value = { "products","productPage"})
public class ProductController {

	@Autowired
	private ProductService productService;


	@InitBinder
	public void initlization(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));

	}
	//前往商品頁面
	@RequestMapping(path = { "/productId.shopping" }, method = RequestMethod.GET)
	public String  saveId(int productId, Model model,HttpSession session) {
		System.out.println("進入轉跳Controller轉跳頁面:"+productId);
		
		if (productId != 0) {
			Product product = productService.search(productId);


			model.addAttribute("productPage", product);
			System.out.println("in :");
		}
		System.out.println("進入轉跳Controller轉跳頁面 back");
		return "page.product";
	}
	
//	//開始填入頁面
//	@RequestMapping(path = { "/productContext.shopping" }, method = RequestMethod.POST)
//	public String  searchId(int productId, Model model) {
//		System.out.println("進入填寫內容Controller:"+productId);
//		if (productId != 0) {
//			Product product = productService.search(productId);
//			model.addAttribute("productPage", product);
//			System.out.println("in :"+product);
//
//		}
//		System.out.println("填寫內容Controller back");
//		return "page.product";
//	}
//	
	
	
	
	

	//測試用新增
//	@RequestMapping(path = { "/controller.shopping" }, method = RequestMethod.POST)
//	public String insertProduct(Product product, BindingResult bindingResult, Model model) throws SQLException {
//		System.out.println("Controller start " + product.getPictureAscii());
//		int saveOk = productService.insertProducts(product);
//		// int saveOk=productService.insertProducts(product);
//		model.addAttribute("saveOk", saveOk);
//
//		System.out.println("Controller ok ");
//		// return "page.productBackstage";
//		return "page.productsearchtest";
//	}


	// 為了後台更新產品
//	@RequestMapping(path = { "/controller.shopping" }, method = RequestMethod.PUT)
//	public String updateProduct(Product product, BindingResult bindingResult, Model model) {
//		System.out.println("Controller start " + product);
//		boolean updateOk = productService.updateProduct(product);
//		model.addAttribute("updateOk", updateOk);
//		System.out.println("Controller ok ");
//
//		return "page.productsearchtest";
//	}

	//商品名搜尋頁面
	@RequestMapping(path = { "/searchProduct.shopping" }, method = RequestMethod.GET)
	public String searchProductFromSearchText(String searchText, Model model) {
		System.out.println("new controller start " + searchText);
		if (searchText != null && searchText.trim().length() != 0) {
			System.out.println("new controller 1");
			List<Product> products = productService.searchText(searchText);

			int page = 1;
			System.out.println("new controller 2" + products);
			model.addAttribute("page", page);

			if (products != null && !products.isEmpty()) {
				// List<Product> page8 = null;

				model.addAttribute("products", products);
				model.addAttribute("page", page);

				System.out.println("new controller out");
				return "page.productsearch";

			} else {

				model.addAttribute("searchResult0", "沒有相關產品");
				return "page.productsearch";
				// return null;
			}

		}

		model.addAttribute("searchResult0", "請輸入想要的產品");
		return "page.productsearch";
		// return null;
	}

	
	//商品利用分頁搜尋頁面
	@RequestMapping(path = { "/searchCatagory.shopping" }, method = RequestMethod.GET)
	public String searchProductFromSearchCategory(String category, Model model) {
		System.out.println("new controller start " + category);
		if (category != null && category.trim().length() != 0) {
			System.out.println("new controller 1");
			List<Product> products = productService.searchByCategory(category);

			int page = 1;
			System.out.println("new controller 2" + products);
			model.addAttribute("page", page);

			if (products != null && !products.isEmpty()) {
				// List<Product> page8 = null;
				model.addAttribute("products", products);
				model.addAttribute("page", page);

				System.out.println("new controller out");
				return "page.productsearch";

			} else {

				model.addAttribute("searchResult0", "沒有相關產品");
				return "page.productsearch";

			}

		}

		model.addAttribute("searchResult0", "請輸入想要的產品");
		return "page.productsearch";

	}

	// 未完成
	@RequestMapping(path = { "/pageChange.shopping" }, method = RequestMethod.GET

	)
	public String nextOrPrevious(String nextORprevious) {

		return null;
	}
}
