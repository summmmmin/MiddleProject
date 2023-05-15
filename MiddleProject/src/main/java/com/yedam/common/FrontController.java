package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.buy.control.BuyCancelControl;
import com.yedam.buy.control.BuyDetailControl;
import com.yedam.buy.control.BuyFormControl;
import com.yedam.buy.control.BuyGetControl;
import com.yedam.buy.control.BuyListControl;
import com.yedam.buy.control.BuyListUControl;
import com.yedam.buy.control.BuyPayControl;
import com.yedam.buy.control.BuyPriceControl;
import com.yedam.buy.control.BuyReturnControl;
import com.yedam.buy.control.BuyUpdateControl;
import com.yedam.buy.control.GetBuyListControl;
import com.yedam.buy.control.ModifyDlvy;
import com.yedam.note.control.DelAllNoteControl;
import com.yedam.note.control.DelNoteControl;
import com.yedam.note.control.GetNoteControl;
import com.yedam.note.control.NoteListControl;
import com.yedam.note.control.NoteSendControl;
import com.yedam.note.control.SendAllControl;
import com.yedam.note.control.SendNoteControl;
import com.yedam.product.control.AddProdControl;
import com.yedam.product.control.DelProdControl;
import com.yedam.product.control.GetProdControl;
import com.yedam.product.control.ModifyProdControl;
import com.yedam.product.control.ProdAddForm;
import com.yedam.product.control.ProdList2Control;
import com.yedam.product.control.ProdListControl;
import com.yedam.product.control.SubCatListControl;
import com.yedam.qna.control.AddQCControl;
import com.yedam.qna.control.AddQnaControl;
import com.yedam.qna.control.DelQnaControl;
import com.yedam.qna.control.GetQnaControl;
import com.yedam.qna.control.ModifyQCControl;
import com.yedam.qna.control.MyQnaControl;
import com.yedam.qna.control.QnaAddControl;
import com.yedam.qna.control.QnaListControl;


import com.yedam.review.control.AddReviewControl;
import com.yedam.review.control.DelReviewControl;
import com.yedam.review.control.GetReviewControl;
import com.yedam.review.control.MyReviewControl;
import com.yedam.review.control.ProdReviewControl;
import com.yedam.sell.control.GetSellListControl;
import com.yedam.sell.control.ModifyAccControl;

import com.yedam.sell.control.SellCancelControl;
import com.yedam.sell.control.SellDetailControl;
import com.yedam.sell.control.SellFormControl;
import com.yedam.sell.control.SellGetControl;
import com.yedam.sell.control.SellListControl;
import com.yedam.sell.control.SellListUControl;
import com.yedam.sell.control.SellPriceControl;
import com.yedam.sell.control.SellUpdateControl;
import com.yedam.user.control.DeleteUserControl;
import com.yedam.user.control.DeleteUserFormControl;
import com.yedam.user.control.FindPassWordFormControl;
import com.yedam.user.control.FindPasswordControl;
import com.yedam.user.control.KakaoLoginControl;
import com.yedam.user.control.KakaoUserControl;
import com.yedam.user.control.LoginControl;
import com.yedam.user.control.LoginFormControl;
import com.yedam.user.control.LogoutControl;
import com.yedam.user.control.ModifyUserControl;
import com.yedam.user.control.ModifyUserFormControl;
import com.yedam.user.control.MypageControl;
import com.yedam.user.control.MypagePwFormControl;
import com.yedam.user.control.MypageViewControl;
import com.yedam.user.control.SignUpControl;
import com.yedam.user.control.SignUpFormControl;
import com.yedam.user.control.UserListControl;
import com.yedam.user.control.UserViewControl;
import com.yedam.user.control.UserViewFormControl;
import com.yedam.wish.control.AddwishList;
import com.yedam.wish.control.DeletewishList;
import com.yedam.wish.control.WishListControl;

public class FrontController extends HttpServlet{
	private Map<String, Control> map;
	String encoding;
	public FrontController() {
		map = new HashMap<>();
	}
	@Override
	public void init(ServletConfig config) throws ServletException {
		encoding = config.getInitParameter("enc");
		// 첫페이지
		map.put("/main.do", new MainControl());
		//qna
		map.put("/qnaList.do", new QnaListControl());
		map.put("/getQna.do", new GetQnaControl());
		map.put("/addQna.do", new AddQnaControl());
		map.put("/qnaAdd.do", new QnaAddControl());
		map.put("/delQna.do", new DelQnaControl());
		map.put("/modifyQC.do", new ModifyQCControl());
		map.put("/addQC.do", new AddQCControl());
		map.put("/myQna.do", new MyQnaControl());
		//product
		map.put("/prodList.do", new ProdListControl());
		map.put("/prodAddForm.do", new ProdAddForm());
		map.put("/addProd.do", new AddProdControl());
		map.put("/getProd.do", new GetProdControl());
		map.put("/modifyProd.do", new ModifyProdControl());
		map.put("/delProd.do", new DelProdControl());
		map.put("/subCatList.do", new SubCatListControl());
		map.put("/prodList2.do", new ProdList2Control());
		//users
		map.put("/logout.do", new LogoutControl());
		map.put("/loginForm.do", new LoginFormControl());
		map.put("/signUpForm.do", new SignUpFormControl());
		map.put("/login.do", new LoginControl());
		map.put("/signUp.do", new SignUpControl());
		map.put("/kakaoLogin.do", new KakaoLoginControl());
		map.put("/kakaoUser.do", new KakaoUserControl());
		map.put("/findPassWord.do",  new FindPasswordControl());
		map.put("/findPassWordForm.do", new FindPassWordFormControl());
		//sell
		map.put("/sellListU.do", new SellListUControl());
		map.put("/sellGet.do", new SellGetControl());
		map.put("/sellPrice.do", new SellPriceControl());
		map.put("/sellForm.do", new SellFormControl());
		map.put("/sellCancel.do", new SellCancelControl());
		map.put("/sellDetail.do", new SellDetailControl());
		map.put("/modifyAcc.do", new ModifyAccControl());
		map.put("/sellUpdate.do", new SellUpdateControl());
		map.put("/mypagePw.do", new MypageControl());
		map.put("/mypageView.do", new MypageViewControl());
		map.put("/deleteUserForm.do", new DeleteUserFormControl());
		map.put("/modifyUser.do", new ModifyUserControl());
		map.put("/modifyUserForm.do", new ModifyUserFormControl());
		map.put("/deleteUser.do", new DeleteUserControl());
		map.put("/userList.do", new UserListControl());
		map.put("/mypagePwForm.do", new MypagePwFormControl());
		
		//note
		map.put("/noteSend.do", new NoteSendControl());
		map.put("/noteList.do", new NoteListControl());
		map.put("/getNote.do", new GetNoteControl());
		map.put("/delNote.do", new DelNoteControl());
		map.put("/delAllNote.do",new DelAllNoteControl());
		map.put("/sendNote.do", new SendNoteControl());
		map.put("/sendAll.do", new SendAllControl());

		
		//buy
		map.put("/buyListU.do", new BuyListUControl());
		map.put("/buyGet.do", new BuyGetControl());
		map.put("/buyCancel.do", new BuyCancelControl());
		map.put("/modifyDlvy.do", new ModifyDlvy());
		map.put("/buyReturn.do", new BuyReturnControl());
		map.put("/buyDetail.do", new BuyDetailControl());
		map.put("/buyPrice.do", new BuyPriceControl());
		map.put("/buyForm.do", new BuyFormControl());
        map.put("/buyPay.do", new BuyPayControl());
        map.put("/buyUpdate.do", new BuyUpdateControl());
        map.put("/buyList.do", new BuyListControl());
		map.put("/getBuyList.do", new GetBuyListControl());
		//wish(관심상품)
		map.put("/wishList.do",  new WishListControl());
		map.put("/deletewishList.do", new DeletewishList());
		map.put("/addwishList.do", new AddwishList());
		
		//review
		map.put("/prodReview.do", new ProdReviewControl());
		map.put("/addReview.do", new AddReviewControl());
		map.put("/delReview.do", new DelReviewControl());
		map.put("/getReview.do", new GetReviewControl());
		map.put("/myReview.do", new MyReviewControl());

		map.put("/sellList.do", new SellListControl());
		map.put("/getSellList.do", new GetSellListControl());
		
		
		map.put("/userViewForm.do", new UserViewFormControl());
		map.put("/userView.do", new UserViewControl());
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding(encoding);
		
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String path = uri.substring(context.length());
		System.out.println(path);
		
		Control control = map.get(path);
		String viewPage = control.execute(req, resp);
		System.out.println(viewPage);
		
		if(viewPage.endsWith(".do")) {
			resp.sendRedirect(viewPage);
			return;		//메소드종료
		} 
		if(viewPage.endsWith(".json")) {
			resp.setContentType("text/json;charset=UTF-8");
			resp.getWriter().print(viewPage.substring(0, viewPage.length()-5));
			return;
		}
		
		//페이지 재지정
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
		
	}
}