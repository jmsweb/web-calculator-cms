<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
 
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="title" value="JMS - Web Based Calculator" />
	<tiles:putAttribute name="body">
		<div>
			<h1>Home page</h1>
			<p>${message.messageText}</p>
		</div>
		<script type="text/javascript">
			$(function() {
				$("body").append("Test 1, 2, 3.");
			});
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>