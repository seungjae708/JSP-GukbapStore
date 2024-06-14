<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Gukbap"%>
<%@ page import="dao.GukbapRepository"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("gukbaps.jsp");
		return;
	}

	GukbapRepository dao = GukbapRepository.getInstance();
	
	Gukbap gukbap = dao.getGukbapById(id);
	if (gukbap == null) {
		response.sendRedirect("exceptionNoGukbapId.jsp");
	}

	ArrayList<Gukbap> cartList = (ArrayList<Gukbap>) session.getAttribute("cartlist");
	Gukbap goodsQnt = new Gukbap();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getGukbapId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
