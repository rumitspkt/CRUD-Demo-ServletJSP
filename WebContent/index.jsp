<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="au theme template" />
<meta name="author" content="Hau Nguyen" />
<meta name="keywords" content="au theme template" />

<!-- Title Page -->
<title>CRUD</title>

<!-- Fontfaces CSS -->
<link href="${pageContext.request.contextPath}/css/font-face.css"
	rel="stylesheet" media="all" />
<link
	href="${pageContext.request.contextPath}/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all" />
<link
	href="${pageContext.request.contextPath}/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all" />
<link
	href="${pageContext.request.contextPath}/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all" />

<!-- Bootstrap CSS -->
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all" />

<!-- Vendor CSS -->
<link
	href="${pageContext.request.contextPath}/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all" />
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all" />
<link href="${pageContext.request.contextPath}/vendor/wow/animate.css"
	rel="stylesheet" media="all" />
<link
	href="${pageContext.request.contextPath}/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all" />
<link href="${pageContext.request.contextPath}/vendor/slick/slick.css"
	rel="stylesheet" media="all" />
<link
	href="${pageContext.request.contextPath}/vendor/select2/select2.min.css"
	rel="stylesheet" media="all" />
<link
	href="${pageContext.request.contextPath}/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all" />
<link
	href="${pageContext.request.contextPath}/vendor/toastr/toastr.min.css"
	rel="stylesheet" media="all" />

<!-- vendor ckeditor -->
<script
	src="${pageContext.request.contextPath}/vendor/ckeditor/ckeditor.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/ckeditor/samples/js/sample.js"></script>

<!-- Main CSS -->
<link href="${pageContext.request.contextPath}/css/theme.css"
	rel="stylesheet" media="all" />
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- header -->
		<%@ include file="/jsp/fragments/header.jsp"%>
		<!-- PAGE CONTAINER -->
		<%@ include file="/jsp/fragments/main.jsp"%>

	</div>

	<!-- Jquery JS -->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap-4.1/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS -->
	<script
		src="${pageContext.request.contextPath}/vendor/slick/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/wow/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/animsition/animsition.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/counter-up/jquery.counterup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/circle-progress/circle-progress.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/chartjs/Chart.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/select2/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/toastr/toastr.min.js"></script>

	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<!-- custom JS -->
	<script src="${pageContext.request.contextPath}/js/custom/contact.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/custom/toastr-config.js"></script>

	<c:forEach items="${successes}" var="success">
		<script>
			toastr["success"]("${success}",
					"Success!")
		</script>
	</c:forEach>
	
	<c:forEach items="${errors}" var="error">
		<script>
			toastr["error"]("${error}",
					"Error!")
		</script>
	</c:forEach>
	
	<%-- <c:if test="${success != null}">
		<script>
			toastr["success"]("${success}",
					"Success!")
		</script>
	</c:if>
	
	<c:if test="${error != null}">
		<script>
			toastr["error"]("${error}",
					"Error!")
		</script>
	</c:if> --%>
</body>
</html>
<!-- end document -->
