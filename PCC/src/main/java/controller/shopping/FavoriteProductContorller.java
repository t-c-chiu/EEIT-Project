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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.FavoriteProduct;
import model.bean.Member;
import model.bean.Product;
import model.service.FavoriteProudctService;
import spring.PrimitiveNumberEditor;

@Controller
@SessionAttributes(value = { "" })
public class FavoriteProductContorller {
	@Autowired
	private FavoriteProudctService favoriteProudctService;

	@InitBinder
	public void initlization(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));

	}

	// 產品加到喜愛蒐藏
	@RequestMapping(path = { "/addToFavoriteProduct.shopping" }, method = RequestMethod.GET, produces = {
			"text/plain;charset=utf-8" })
	public @ResponseBody String addToFavoriteProduct(FavoriteProduct favoriteProudct, HttpSession session,
			Model model) {
		if (favoriteProudct != null) {
			Member member = (Member) session.getAttribute("member");
			if(member==null) {
				return "請先登入會員";
			}
			
			String id = member.getMemberId();
			favoriteProudct.setMemberId(id);
			int result = favoriteProudctService.insertFP(favoriteProudct);
			if (result == -1) {

				return "已經在收藏清單中，請選其他商品!";
			}

			return "已收藏! 可到會員中心查詢!";

		}

		return "收藏失敗!";
	}

	// 到會員中心秀出畫面
	@RequestMapping(path = { "/ShowFavoriteProduct.shopping" }, method = RequestMethod.GET, produces = {
			"application/json;charset=utf-8" })
	public @ResponseBody List<Product> ShowFavoriteProduct(HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");
		List<Product> listProduct = favoriteProudctService.selectFP(member.getMemberId());

		return listProduct;

	}

	// 在會員中心點刪除 會刪除我的最愛
	@RequestMapping(path = { "/DeleteFavoriteProduct.shopping" }, method = RequestMethod.GET, produces = {
			"text/plian;charset=utf-8" })
	public @ResponseBody String DeleteFavoriteProduct(HttpSession session, int productId, Model model) {
		Member member = (Member) session.getAttribute("member");
		boolean b = favoriteProudctService.deleteFP(member.getMemberId(), productId);
		if (b == true) {
			return "已刪除!";
		}
		return "刪除失敗!";
	}

}
