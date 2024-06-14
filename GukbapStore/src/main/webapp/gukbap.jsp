<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage = "exceptionNoGukbapId.jsp"%>
<html>
<head>
 <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">

<title>국밥 메뉴 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("메뉴를 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">메뉴 정보</h1>
        <p class="col-md-8 fs-4">GukbapInfo</p>      
      </div>
    </div>
	<%@ include file="dbconn.jsp" %>  
   <%
       String id = request.getParameter("id");
       if (id == null || id.trim().isEmpty()) {
           response.sendRedirect("exceptionNoGukbapId.jsp");
           return;
       }
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       
       try {
           String sql = "SELECT * FROM gukbap WHERE g_id = ?";
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, id);
           rs = pstmt.executeQuery();
           
           if (!rs.next()) {
               response.sendRedirect("exceptionNoGukbapId.jsp");
               return;
           }
   %>
	 <div class="row align-items-md-stretch">
	 		<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("g_filename")%>" style="width: 70%">
			</div>
			<div class="col-md-12">
				<h3><b><%=rs.getString("g_name")%></b></h3>
				<p><%=rs.getString("g_description")%>
				<p><b>메뉴 번호 : </b><span class="badge text-bg-danger"> <%=rs.getString("g_id")%></span>											
				<p><b>분류</b> : <%=rs.getString("g_category")%>
				<p><b>총 주문수</b> : <%=rs.getString("g_orderQuantity")%>
				<p>평점 : <%
						int rating = Integer.parseInt(rs.getString("g_reviewRating"));
		                for(int idx = 0; idx < rating; idx++){
		                    out.print("★");
		                }
                    %>
                <p><%=rs.getString("g_reviewCount")%>개의 리뷰
				<p><%=rs.getString("g_price")%>원
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("g_id")%>" method="post">
				<a href="#" class="btn btn-info" onclick="addToCart()"> 메뉴주문 &raquo;</a> 
				    <a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>				
					<a href="./gukbaps.jsp" class="btn btn-secondary"> 메뉴목록 &raquo;</a>
					</form>
			</div>
		</div>
		<%
       } catch (Exception e) {
           e.printStackTrace();
       } finally {
           if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
           if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
           if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
       }
   %>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
