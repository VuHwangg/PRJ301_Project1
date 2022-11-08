
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        
        
        
        <link rel="stylesheet" href="styles/login-style.css">
    </head>
    <body>
        <form action="login" method="post">
            <table>
                <tr>
                    <td><label for="username">Username&nbsp;</label></td>
                    <td><input type="text" style="width: 100%" id="username" name="username"><br/></td>
                </tr>
                <tr>
                    <td><label for="password">Password&nbsp;</label></td>
                    <td><input type="password" style="width: 100%" id="password" name="password"><br/></td>
                </tr>
                <c:if test="${requestScope.access eq 1}">
                    <tr><td colspan="2">Your username or password wrong, please try again<td></tr>
                </c:if>
                <c:if test="${requestScope.access eq 2}">
                    <tr><td colspan="2">Your account does not have any role, please try again<td></tr>
                </c:if>
            </table>
            <input type="submit" value="Login" id="submit">
            
        </form>
    </body>
</html>
