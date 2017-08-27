<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: klyab
  Date: 22.08.2017
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
Hi, ${user.name}
<a href="<spring:url value="/game" />">Start game</a>
<a href="<c:url value="/j_spring_security_logout" />">logout</a>
</form>
</body>
</html>
