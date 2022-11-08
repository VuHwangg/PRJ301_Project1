
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
                    <td><input type="text"  id="username" name="username"><br/></td>
                </tr>
                <tr>
                    <td><label for="password">Password&nbsp;</label></td>
                    <td><input type="password"  id="password" name="password"><br/></td>
                </tr>
            </table>
            <input type="submit" value="Login" id="submit">
        </form>
    </body>
</html>
