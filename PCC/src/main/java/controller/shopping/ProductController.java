package controller.shopping;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Product;
import model.service.ProductService;
import spring.PrimitiveNumberEditor;

@Controller
@SessionAttributes(value= {"products"})
public class ProductController {

	@Autowired
	private ProductService productService;

	@InitBinder
	public void initlization(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));

	}

	@RequestMapping(path = { "/controller.shopping" }, method = RequestMethod.GET)
	public String searchId(int productId, Model model) {

		if (productId != 0) {
			Product product = productService.search(productId);
			model.addAttribute("products", product);

			// System.out.println("Controller ok "+product);

		}
		return "page.productsearchtest";
	}

	@RequestMapping(path = { "/controller.shopping" }, method = RequestMethod.POST)
	public String insertProduct(Product product, BindingResult bindingResult, Model model) throws SQLException {
		System.out.println("Controller start " + product.getPictureAscii());
		int saveOk = productService.insertProducts(product);
		// int saveOk=productService.insertProducts(product);
		model.addAttribute("saveOk", saveOk);

		System.out.println("Controller ok ");
		// return "page.productBackstage";
		return "page.productsearchtest";
	}

	@RequestMapping(path = { "/controller.shopping" }, method = RequestMethod.PUT)
	public String updateProduct(Product product, BindingResult bindingResult, Model model) {
		System.out.println("Controller start " + product);
		boolean updateOk = productService.updateProduct(product);
		model.addAttribute("updateOk", updateOk);
		System.out.println("Controller ok ");

		return "page.productsearchtest";
	}

	
	
	
	
	
	
	
	
	@RequestMapping(path = { "/searchProduct.shopping" }, method = RequestMethod.GET 
//	 produces= {"text/plain;charset=UTF-8"}
//	 produces= {"application/json;charset=UTF-8"}
	// consumes="text/plain"
	)
	public  String searchProductFromSearchText(String searchText,Model model) {
		System.out.println("new controller start "+searchText);
		if (searchText != null && searchText.trim().length() != 0 ) {
			System.out.println("new controller 1");
			List<Product> products = productService.searchText(searchText);
			
			int page=1;
			 System.out.println("new controller 2"+products);
			 model.addAttribute("page", page);
			
			if (products != null && !products.isEmpty()) {
//				List<Product> page8 = null; 
				model.addAttribute("products", products);
				model.addAttribute("page", page);
				
//				for (int i = 0; i < 8; i++) {
//					System.out.println("above::::"+page8);
//					Product product = products.get(i);
//					page8.add(product);
//					System.out.println("under::::"+page8);
//				}
//				
//				model.addAttribute("pags8", page8);
				System.out.println("new controller out");
				return "page.productsearch";
//				return products;

			} else {

				model.addAttribute("searchResult0", "沒有相關產品");
				return "page.productsearch";
//				return null;
			}

		}

		model.addAttribute("searchResult0", "請輸入想要的產品");
		return "page.productsearch";
//		return null;
	}
	
	
	
	
	
	
	
	@RequestMapping(path = { "/pageChange.shopping" }, method = RequestMethod.GET

	)
	public String nextOrPrevious(String nextORprevious) {
		
		return null;
	}
}
