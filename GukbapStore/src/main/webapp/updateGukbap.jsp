<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />

<title>국밥 메뉴 수정</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">국밥 메뉴 수정</h1>
        <p class="col-md-8 fs-4">Gukbap Updating</p>      
      </div>
    </div>
  <%@ include file="dbconn.jsp"%>
  <%
		String id = request.getParameter("id");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from gukbap where g_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>		
	 <div class="row align-items-md-stretch">	  	
		
		<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("g_filename")%>" alt="image" style="width: 100%" />
			</div>
		<div class="col-md-7">	
		<form name="newGukbap" action="./processUpdateGukbap.jsp" method="post" enctype ="multipart/form-data">		
			<div class="mb-3 row">
				<label class="col-sm-2">메뉴 번호</label>
				<div class="col-sm-5">
					<input type="text" name="id" id="id" class="form-control" value='<%=rs.getString("g_id")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">메뉴명</label>
				<div class="col-sm-5">
					<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("g_name")%>'>
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-5">
					<input type="text" name="price"  id="price"class="form-control" value='<%=rs.getString("g_price")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">총 주문수량</label>
				<div class="col-sm-5">
					<input type="text" name="orderQuantity" class="form-control" value='<%=rs.getString("g_orderQuantity")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">리뷰 평점</label>
				<div class="col-sm-3">
					<select name="reviewRating" class="form-control" size="3">
						<option value="1">1점</option>
						<option value="2">2점</option>
						<option value="3">3점</option>
						<option value="4">4점</option>
						<option value="5">5점</option>
					</select>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">리뷰 수</label>
				<div class="col-sm-5">
					<input type="text" name="reviewCount" class="form-control" value='<%=rs.getString("g_reviewCount")%>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-8">
					<textarea  name="description" id="description" cols="50" rows="2"
						class="form-control" placeholder="최소 4자 이상 적어주세요"><%=rs.getString("g_description")%></textarea>
				</div>
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-4">
					<input type="radio" name="category" value="국밥" > 국밥
					<input type="radio" name="category" value="순대" > 순대
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-8">
					<input type="file" name="gukbapImage" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록 " >
				</div>
			</div>
		</form>
	</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
	<jsp:include page="footer.jsp" />
</div>	
</div>
</body>
</html>
