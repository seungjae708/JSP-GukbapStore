<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Gukbap"%>
<%@ page import="dao.GukbapRepository"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>
    <%
        String shipping_cartId = "";
        String shipping_name = "";
        String shipping_shippingDate = "";
        String shipping_country = "";
        String shipping_zipCode = "";
        String shipping_addressName = "";        

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie thisCookie = cookies[i];
                String n = thisCookie.getName();
                if (n.equals("Shipping_cartId"))
                    shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                if (n.equals("Shipping_name"))
                    shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                if (n.equals("Shipping_shippingDate"))
                    shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                if (n.equals("Shipping_country"))
                    shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                if (n.equals("Shipping_zipCode"))
                    shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
                if (n.equals("Shipping_addressName"))
                    shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
            }
        }
    %>
    
<div class="container py-4">
   <%@ include file="menu.jsp"%>   

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">주문 완료</h1>
        <p class="col-md-8 fs-4">Order Completed</p>      
      </div>
    </div>
  
      <div class="row align-items-md-stretch ">
        <h2 class="alert alert-danger"><% out.println(shipping_name); %>님, 주문해주셔서 감사합니다.</h2>
        <p>주문은 <% out.println(shipping_shippingDate); %>에 배송될 예정입니다!</p>   
        <p>주문번호 : <% out.println(shipping_cartId); %></p>
        <br>
        <p><h5>주문내역</h5></p>
        <div class="py-5">
            <table class="table table-hover">            
                <tr>
                    <th class="text-center">메뉴</th>
                    <th class="text-center">#</th>
                    <th class="text-center">가격</th>
                    <th class="text-center">소계</th>
                </tr>
                <%
                    int sum = 0;
                    ArrayList<Gukbap> cartList = (ArrayList<Gukbap>) session.getAttribute("cartlist");
                    if (cartList == null)
                        cartList = new ArrayList<Gukbap>();
                    for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
                        Gukbap gukbap = cartList.get(i);
                        int total = gukbap.getPrice() * gukbap.getShoppingBasket();
                        sum = sum + total;
                %>
                <tr>
                    <td class="text-center"><em><%= gukbap.getName() %> </em></td>
                    <td class="text-center"><%= gukbap.getShoppingBasket() %></td>
                    <td class="text-center"><%= gukbap.getPrice() %>원</td>
                    <td class="text-center"><%= total %>원</td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td> </td>
                    <td> </td>
                    <td class="text-right"><strong>총액: </strong></td>
                    <td class="text-center text-danger"><strong><%= sum %> 원</strong></td>
                </tr>
            </table>
        </div>
        <p><h5>배송 주소</h5></p>
        <p>우편번호 : <% out.println(shipping_zipCode); %></p>
        <p>주소 : <% out.println(shipping_addressName); %>(<% out.println(shipping_country); %>)
    </div>
    <div class="container">
        <p><a href="./gukbaps.jsp" class="btn btn-secondary"> &laquo;국밥 메뉴 목록</a></p>
    </div>
    <%@ include file="footer.jsp"%>   
  </div>
</body>
</html>
<%
    session.invalidate();

    for (int i = 0; i < cookies.length; i++) {
        Cookie thisCookie = cookies[i];
        String n = thisCookie.getName();
        if (n.equals("Shipping_cartId"))
            thisCookie.setMaxAge(0);
        if (n.equals("Shipping_name"))
            thisCookie.setMaxAge(0);
        if (n.equals("Shipping_shippingDate"))
            thisCookie.setMaxAge(0);
        if (n.equals("Shipping_country"))
            thisCookie.setMaxAge(0);
        if (n.equals("Shipping_zipCode"))
            thisCookie.setMaxAge(0);
        if (n.equals("Shipping_addressName"))
            thisCookie.setMaxAge(0);
        
        response.addCookie(thisCookie);
    }
%>
