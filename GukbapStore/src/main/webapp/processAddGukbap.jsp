<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	
	String realFolder = "C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GukbapStore\\resources\\images";
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	String encType = "utf-8"; //인코딩 타입
	
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String id = multi.getParameter("id");
	String name = multi.getParameter("name");
	String price = multi.getParameter("price");
	String orderQuantity = multi.getParameter("orderQuantity");
	String reviewRating = multi.getParameter("reviewRating");
	String reviewCount = multi.getParameter("reviewCount");	
	String description = multi.getParameter("description");	
	String category = multi.getParameter("category");
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	int menuPrice;

	if (price.isEmpty())
		menuPrice = 0;
	else
		menuPrice = Integer.valueOf(price);
	
	int quantity;

	if (orderQuantity.isEmpty())
		quantity = 0;
	else
		quantity = Integer.valueOf(orderQuantity);
	
	int rating;

	if (reviewRating.isEmpty())
		rating = 0;
	else
		rating = Integer.valueOf(reviewRating);
	
	int count;

	if (reviewCount.isEmpty())
		count = 0;
	else
		count = Integer.valueOf(reviewCount);

	
	PreparedStatement pstmt = null;	
	
	String sql = "insert into gukbap values(?,?,?,?,?,?,?,?,?)";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setInt(3, menuPrice);
	pstmt.setString(4, description);
	pstmt.setString(5, category);
	pstmt.setInt(6, quantity);
	pstmt.setInt(7, rating);
	pstmt.setInt(8, count);
	pstmt.setString(9, fileName);	
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

	response.sendRedirect("gukbaps.jsp");

%>
