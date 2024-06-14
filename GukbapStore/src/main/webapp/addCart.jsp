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

	ArrayList<Gukbap> goodsList = dao.getAllGukbaps();
	Gukbap goods = new Gukbap();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getGukbapId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Gukbap> list = (ArrayList<Gukbap>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Gukbap>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Gukbap goodsQnt = new Gukbap();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getGukbapId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getShoppingBasket() + 1;
			goodsQnt.setShoppingBasket(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setShoppingBasket(1);
		list.add(goods);
	}

	response.sendRedirect("gukbap.jsp?id=" + id);
%>