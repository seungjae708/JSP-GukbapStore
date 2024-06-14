<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <link href = "./resources/css/bootstrap.min.css" rel="stylesheet">
    <title>국밥 메뉴 목록</title>
</head>
<body>
<div class="container py-4">
    <%@ include file="menu.jsp"%>
   
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">메뉴 목록</h1>
            <p class="col-md-8 fs-4">GukbapList</p>      
        </div>
    </div>
    <%@ include file="dbconn.jsp" %>
    <div class="row align-items-md-stretch text-center">
        <!-- 국밥 리스트 출력 -->
        <br><br><br><h3><b>국밥 메뉴</b></h3><br><br><br>
        <%
		    PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from gukbap where g_category = '국밥'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
	  	%>
            <div class="col-md-4">
                <div class="h-100 p-2">
                	<img src="./resources/images/<%=rs.getString("g_fileName")%>" style="width: 350; height:350" />
                    <h5><b style="color:blue;"><%=rs.getString("g_name")%></b></h5>
                    <p><%=rs.getString("g_price")%>원
                    <br>
                    <p> <%=rs.getString("g_description")%>
                    <p><%
                        int rating = Integer.parseInt(rs.getString("g_reviewRating"));
                        for(int idx = 0; idx < rating; idx++){
                            out.print("★");
                        }
                    %>
                    <p><%=rs.getString("g_reviewCount")%>개의 리뷰
                    <p><a href="./gukbap.jsp?id=<%=rs.getString("g_id")%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
                </div>
            </div>
        <%
			}
		if (rs != null) 
			rs.close();
		if (pstmt != null)
			pstmt.close();
		
		%>   
    </div>
    
    <hr>

    <div class="row align-items-md-stretch text-center mt-4">
        <!-- 순대 리스트 출력 -->
        <br><br><br><h3><b>순대 메뉴</b></h3><br><br><br>
        <%
		    PreparedStatement pstmt1 = null;
			ResultSet rs1 = null;
			
			String sql1 = "select * from gukbap where g_category = '순대'";
			pstmt1 = conn.prepareStatement(sql1);
			rs1 = pstmt1.executeQuery();
			while (rs1.next()) {
	  	%>
            <div class="col-md-4">
                <div class="h-100 p-2">
                	<img src="./resources/images/<%=rs1.getString("g_fileName")%>" style="width: 350; height:350" />
                    <h5><b style="color:red;"><%=rs1.getString("g_name")%></b></h5>
                    <p><%=rs1.getString("g_price")%>원
                    <br>
                    <p> <%=rs1.getString("g_description")%>
                    <p><%
                        int rating = Integer.parseInt(rs1.getString("g_reviewRating"));
                        for(int idx = 0; idx < rating; idx++){
                            out.print("★");
                        }
                    %>
                    <p><%=rs1.getString("g_reviewCount")%>개의 리뷰
                    <p><a href="./gukbap.jsp?id=<%=rs1.getString("g_id")%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
                </div>
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
    </div>
    
    <%@ include file="footer.jsp"%>   
</div>
</body>
</html>
