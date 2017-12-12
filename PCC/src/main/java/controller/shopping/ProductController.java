package controller.shopping;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.Product;
import model.service.ProductService;
import spring.PrimitiveNumberEditor;

@Controller
@RequestMapping(path= {"/controller.shopping"})
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	
	
	@InitBinder
	public void initlization(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(int.class,  new PrimitiveNumberEditor(Integer.class, true));
			
	}
	
	
	
	
	@RequestMapping(
		method=RequestMethod.GET)
	public String searchId(int productId,Model model) {
		
		if(productId!=0) {
		Product product=productService.search(productId);
		model.addAttribute("products", product);
		
//		System.out.println("Controller ok "+product);
		
		}
		return "page.productsearch";
	}
	
	
	@RequestMapping(
			
			method=RequestMethod.POST)
		public String insertProduct(Product product,BindingResult bindingResult,Model model	) throws SQLException {
		System.out.println("Controller start "+product);
		int saveOk=productService.insertProducts(product);
//		int saveOk=productService.insertProducts(product);
			model.addAttribute("saveOk", saveOk);

			System.out.println("Controller ok ");
			return "page.productBackstage";
		}

}
