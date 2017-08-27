<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: klyab
  Date: 22.08.2017
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<c:if test="${not empty error}">
    <div class="alert alert-danger">
        <spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/><br/>
    </div>
</c:if>
<a href="<spring:url value="/welcome" />">Back</a>
<form modelAttribute="newUser" method="post">
    <form:input id="username" path="username" type="text" />
    <form:input id="password" path="password" type="text" />
    <form:input id="age" path="age" type="text" />
    <input type="submit" id="btnReg" value="Registration"/>
</form>
</body>
</html>
