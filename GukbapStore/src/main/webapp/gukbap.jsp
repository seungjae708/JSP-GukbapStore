<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Gukbap"%>
<%@ page import="dao.GukbapRepository"%>
<%@ page errorPage = "exceptionNoGukbapId.jsp"%>

<html>
<head>
 <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">

<title>국밥 메뉴 정보</title>
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
	
	<%
		String id = request.getParameter("id");
		GukbapRepository dao = GukbapRepository.getInstance();
		Gukbap gukbap = dao.getGukbapById(id);
	%>
	 <div class="row align-items-md-stretch">
	 		<div class="col-md-5">
				<img src="./resources/images/<%=gukbap.getFileName()%>" style="width: 70%">
			</div>
			<div class="col-md-12">
				<h3><b><%=gukbap.getName()%></b></h3>
				<p><%=gukbap.getDescription()%>
				<p><b>메뉴 번호 : </b><span class="badge text-bg-danger"> <%=gukbap.getGukbapId()%></span>											
				<p><b>분류</b> : <%=gukbap.getCategory()%>
				<p><b>총 주문수</b> : <%=gukbap.getOrderQuantity()%>
				<p>평점 : <%
                        int rating = gukbap.getReviewRating();
                        for(int idx = 0; idx < rating; idx++){
                            out.print("★");
                        }
                    %>
               	<p><%=gukbap.getReviewCount() %>개의 리뷰
				<p>가격 : <%=gukbap.getPrice()%>원
				<p><a href="#" class="btn btn-info"> 메뉴 주문 &raquo;</a> 
					<a href="./gukbaps.jsp" class="btn btn-secondary"> 국밥메뉴목록 &raquo;</a>
			</div>
		</div>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
