<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Gukbap"%>
<%@ page import="dao.GukbapRepository"%>
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
    <%
    	GukbapRepository dao = GukbapRepository.getInstance();
        ArrayList<Gukbap> listOfGukbaps = dao.getAllGukbaps();
    %>   

    <div class="row align-items-md-stretch text-center">
        <!-- 국밥 리스트 출력 -->
        <br><br><br><h3><b>국밥 메뉴</b></h3><br><br><br>
        <%
            for (int i = 0; i < listOfGukbaps.size(); i++) {
                Gukbap gukbap = listOfGukbaps.get(i);
                if ("국밥".equals(gukbap.getCategory())) {
        %>
            <div class="col-md-4">
                <div class="h-100 p-2">
                	<img src="./resources/images/<%=gukbap.getFileName()%>" style="width: 350; height:350" />
                    <h5><b style="color:blue;"><%=gukbap.getName()%></b></h5>
                    <p><%=gukbap.getPrice()%>원
                    <br>
                    <p> <%=gukbap.getDescription()%>
                    <p><%
                        int rating = gukbap.getReviewRating();
                        for(int idx = 0; idx < rating; idx++){
                            out.print("★");
                        }
                    %>
                    <p><%=gukbap.getReviewCount() %>개의 리뷰
                    <p><a href="./gukbap.jsp?id=<%=gukbap.getGukbapId()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
                </div>
            </div>
        <%
                }
            }
        %>    
    </div>
    
    <hr>

    <div class="row align-items-md-stretch text-center mt-4">
        <!-- 순대 리스트 출력 -->
        <br><br><br><h3><b>순대 메뉴</b></h3><br><br><br>
        <%
            for (int i = 0; i < listOfGukbaps.size(); i++) {
                Gukbap gukbap = listOfGukbaps.get(i);
                if ("순대".equals(gukbap.getCategory())) {
        %>
            <div class="col-md-4">
                <div class="h-100 p-2">
                	<img src="./resources/images/<%=gukbap.getFileName()%>" style="width: 350; height:350" />
                    <h5><b style="color:red;"><%=gukbap.getName()%></b></h5>
                    <p><%=gukbap.getPrice()%>원
                    <br>
                    <p> <%=gukbap.getDescription()%>
                    <p><%
                        int rating = gukbap.getReviewRating();
                        for(int idx = 0; idx < rating; idx++){
                            out.print("★");
                        }
                    %>
                    <p><%=gukbap.getReviewCount() %>개의 리뷰
                    <p><a href="./gukbap.jsp?id=<%=gukbap.getGukbapId()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
                </div>    
            </div>            
        <%
                }
            }
        %>    
    </div>
    
    <%@ include file="footer.jsp"%>   
</div>
</body>
</html>
