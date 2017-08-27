<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title>Bulls and cows</title>
</head>
<body>
<c:if test="${not empty error}">
    <div class="alert alert-danger">
        <spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/><br/>
    </div>
</c:if>
<a href="<spring:url value="/welcome" />">Back</a>
<form action="<c:url value="/j_spring_security_check"></c:url>" method="post">
    <input class="form-control" placeholder="User Name" name='j_username' type="text">
    <input class="form-control" placeholder="Password" name='j_password' type="password" value="">
    <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
</form>
</body>
</html>
