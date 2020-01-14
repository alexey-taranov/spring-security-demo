<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>

    <title>Company Home Page</title>

<body>

<h2>Company Home Page</h2>
<hr>

<p>
    Welcome to the Company Home Page!
</p>

<hr>

<!-- display user name and role -->
<p>
    User: <security:authentication property="principal.username" />
    <br><br>
    Role(s): <security:authentication property="principal.authorities" />
</p>

<security:authorize access="hasRole('MANAGER')">
    <!-- add a link to point to /leaders ... this is for a managers -->
    <p>
        <a href="${pageContext.request.contextPath}/leaders">Leadership meeting</a>
        (Only for manager)
    </p>
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
    <!-- add a link to point to /systems ... this is for a admin -->
    <p>
        <a href="${pageContext.request.contextPath}/systems">IT Systems meeting</a>
        (Only for admin)
    </p>
</security:authorize>

<hr>

<form:form  action="${pageContext.request.contextPath}/logout"
            method="post">

    <input type="submit" value="Logout" />
</form:form>

</body>
</head>

</html>