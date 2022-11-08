<%-- 
    Document   : checkatt
    Created on : Nov 7, 2022, 2:59:33 PM
    Author     : bonne
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Attendance</title>


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
                    <a class="bold-letter" href="timetable?lid=${requestScope.ses.getLecturer().getId()}">View Schedule</a>
                    <span>|</span>
                    <span class="bold-letter">Check Attendance</span>
                </div>
                <div class="nav-right bold-letter">
                    <a href="#" >${requestScope.ses.lecturer.name}</a>
                    <span>|</span>
                    <a href="../logout">logout</a>
                    <span>|</span>
                    <span class="campus">CAMPUS: FPTU-Hòa Lạc</span>
                </div>
            </nav>
            <div class="content">
                <div class="note">
                    <h2 class="thin-letter">Check Attendance</h2>
                    <p>
                        Attendance for <span class="bold-letter">${requestScope.ses.group.subject.name} - ${requestScope.ses.group.name}</span> 
                        with lecturer <span class="bold-letter">${requestScope.ses.lecturer.name}</span> 
                        at Slot <span>${requestScope.ses.timeslot.id}</span> 
                        on <span>${requestScope.ses.date}</span>, in room
                        <span>${requestScope.ses.room.name}</span> at FU-HL
                    </p>
                </div>
                <div class="table">
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Group</th>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Status</th>
                                <th>Comment</th>
                                <th>Taker</th>
                                <th>Record time</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${requestScope.ses.attandances}" var="a" varStatus="loop">
                                <tr>
                                    <td>${loop.index+1}</td>
                                    <td>${requestScope.ses.group.name}</td>
                                    <td>${a.student.code}</td>
                                    <td>${a.student.name}</td>
                                    <td>
                                        <div class="img-avatar">
                                            <img src="../img/avatar-icon.webp">
                                        </div>
                                    </td>
                                    <td>
                                        <c:if test="${!a.present}">
                                            <font color="red">Absent</font>
                                        </c:if>
                                        <c:if test="${a.present}">
                                            <font color="green">Present</font>
                                        </c:if>
                                    </td>
                                    <td>${a.description}</td>
                                    <td>${requestScope.ses.lecturer.name}</td>
                                    <td>${a.record_time}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <footer>
                <p class="line-1"><span class="bold-letter">Mọi góp ý, thắc mắc xin liên hệ:</span> Phòng dịch vụ sinh viên: Email: <a href="#">dichvusinhvien@fe.edu.vn.</a> Điện thoại: <span class="bold-letter">(024)7308.13.13</span></p>
                <p class="line-2">&copy; Powered by <a href="#">FPT University</a> |  <a href="#">CMS</a> |  <a href="#">library</a> |  <a href="#">books24x7</a></p>
            </footer>
        </div>
    <body>
</html>
