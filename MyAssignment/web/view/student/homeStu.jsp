<%-- 
    Document   : home
    Created on : Nov 8, 2022, 5:10:39 PM
    Author     : bonne
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="../styles/style.css">
    </head>
    <body>
        <div class="container">
            <header>
                <div class="title">
                    <h1 class="thin-letter">FPT University Academic Portal</h1>
                </div>
                <div class="link-store">
                    <p class="bold-letter">FAP mobile app (myFAP) is ready at</p>
                    <div class="images">
                        <img src="../img/app-store.svg" alt="app-store-logo">
                        <img src="../img/play-store.svg" alt="gg-play-logo">
                    </div>
                </div>
            </header>
            <nav>
                <div class="nav-left">
                    <a class="bold-letter" href="home">Home</a>
                    <span>|</span>
                </div>
                <div class="nav-right bold-letter">
                    <a href="#" >${sessionScope.account.displayName}</a>
                    <span>|</span>
                    <a href="../logout">logout</a>
                    <span>|</span>
                    <span class="campus">CAMPUS: FPTU-Hòa Lạc</span>
                </div>
            </nav>
            <div class="content">
                <h2><a href="timetable">Timetable for Student</a></h2>
            </div>

            <footer>
                <p class="line-1"><span class="bold-letter">Mọi góp ý, thắc mắc xin liên hệ:</span> Phòng dịch vụ sinh viên: Email: <a href="#">dichvusinhvien@fe.edu.vn.</a> Điện thoại: <span class="bold-letter">(024)7308.13.13</span></p>
                <p class="line-2">&copy; Powered by <a href="#">FPT University</a> |  <a href="#">CMS</a> |  <a href="#">library</a> |  <a href="#">books24x7</a></p>
            </footer>
        </div>
    </body>
</html>
