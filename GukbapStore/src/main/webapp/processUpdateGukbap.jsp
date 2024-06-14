<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");


	String filename = "";
	//String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로


	String realFolder = "C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GukbapStore\\resources\\images";
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
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
	ResultSet rs = null;
	
	String sql = "select * from gukbap where g_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();	
	
	
	if (rs.next()) {		
		if (fileName != null) {
			sql = "UPDATE gukbap SET g_name=?, g_price=?, g_description=?, g_category=?, g_orderQuantity=?, g_reviewRating=?, g_reviewCount=?, g_fileName=? WHERE g_id=?";	
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setInt(2, menuPrice);
			pstmt.setString(3, description);
			pstmt.setString(4, category);
			pstmt.setInt(5, quantity);
			pstmt.setInt(6, rating);
			pstmt.setInt(7, count);
			pstmt.setString(8, fileName);
			pstmt.setString(9, id);	
			pstmt.executeUpdate();
			
					
		} else {
			sql = "UPDATE gukbap SET g_name=?, g_price=?, g_description=?, g_category=?, g_orderQuantity=?, g_reviewRating=?, g_reviewCount=? WHERE g_id=?";	
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setInt(2, menuPrice);
			pstmt.setString(3, description);
			pstmt.setString(4, category);
			pstmt.setInt(5, quantity);
			pstmt.setInt(6, rating);
			pstmt.setInt(7, count);
			pstmt.setString(8, id);	
			pstmt.executeUpdate();
		}		
	}
	

	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	

	response.sendRedirect("editGukbap.jsp?edit=update");

%>
