<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: klyab
  Date: 22.08.2017
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<h1> ${greeting} </h1>
<p> ${tagline} </p>

<form action="/game" method="get">
    <input type="submit" value="Go">
</form>

<a href=" <spring:url value="/login " />">Log in</a>
<a href=" <spring:url value="/registration" />">Registration</a>
</body>
</html>
