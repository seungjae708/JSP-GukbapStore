<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
 <script type="text/javascript" src="./resources/js/validation.js"></script>
<title>국밥 메뉴 등록</title>
</head>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message">
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><fmt:message key="title" /></h1>
        <p class="col-md-8 fs-4">Menu Addition</p>      
      </div>
    </div>
  
	 <div class="row align-items-md-stretch">
	 	<div class="text-end"> 
			<a href="?language=ko" >Korean</a> | <a href="?language=en" >English</a>
			<a href="logout.jsp" class="btn btn-sm btn-success pull right">logout</a>
		</div>
		<form name="newGukbap" action="./processAddGukbap.jsp" method="post" enctype ="multipart/form-data">			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="id"/></label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="name" /></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="price" /></label>
				<div class="col-sm-3">
					<input type="text" id="price" name="price" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="orderQuantity" /></label>
				<div class="col-sm-3">
					<input type="text" id="orderQuantity" name="orderQuantity" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="reviewRating" /></label>
				<div class="col-sm-3">
					<select name="reviewRating" class="form-control" size="3">
						<option value="1"><fmt:message key="reviewRating_One" /></option>
						<option value="2"><fmt:message key="reviewRating_Two" /></option>
						<option value="3"><fmt:message key="reviewRating_Three" /></option>
						<option value="4"><fmt:message key="reviewRating_Four" /></option>
						<option value="5"><fmt:message key="reviewRating_Five" /></option>
					</select>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="reviewCount" /></label>
				<div class="col-sm-3">
					<input type="text" id="reviewCount" name="reviewCount" class="form-control">
				</div>
			</div>
	
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2"
						class="form-control" placeholder="<fmt:message key="minimum"/>"></textarea>
				</div>
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="category" /></label>
				<div class="col-sm-4">
					<input type="radio" name="category" value="국밥" > <fmt:message key="category_Gukbap" />
					<input type="radio" name="category" value="순대" > <fmt:message key="category_Sundae" />
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="gukbapImage" /></label>
				<div class="col-sm-5">
					<input type="file" name="gukbapImage" class="form-control">
				</div>
			</div>	
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button"/>" onclick="CheckAddGukbap()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</div>
</fmt:bundle>
</body>
</html>
