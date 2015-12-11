<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>  
	    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	    <meta name='viewport' content='width=device-width, initial-scale=1'>
	    <link href='<c:url value="/resources/css/style.css" />' rel='stylesheet' />
	    <script type="text/javascript" src='<c:url value="/resources/js/jquery-2.1.4.min.js" />'></script>
	    <title><tiles:insertAttribute name="title" /></title>
	</head>
	<body>
	    <div class="container">
	        <tiles:insertAttribute name="header" />
	        <div class="content">
	            <tiles:insertAttribute name="body" />
	        </div>
	        <tiles:insertAttribute name="footer" />
	    </div>
	</body>
</html>