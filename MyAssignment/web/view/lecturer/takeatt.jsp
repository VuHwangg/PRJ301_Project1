
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
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
                    <a href="index.html">Home</a>
                    <span>|</span>
                    <a class="bold-letter" href="timetable?lid=${requestScope.ses.getLecturer().getId()}">View Schedule</a>
                    <span>|</span>
                    <span class="bold-letter">Take Attendance</span>
                </div>
                <div class="nav-right bold-letter">
                    <a href="#" >${requestScope.ses.lecturer.name}</a>
                    <span>|</span>
                    <a href="#">logout</a>
                    <span>|</span>
                    <span class="campus">CAMPUS: FPTU-Hòa Lạc</span>
                </div>
            </nav>
            <div class="content">
                <div class="note">
                    <h2 class="thin-letter">Take Attendance</h2>
                    <p>
                        Attendance for <span class="bold-letter">${requestScope.ses.group.subject.name} - ${requestScope.ses.group.name}</span> 
                        with lecturer <span class="bold-letter">${requestScope.ses.lecturer.name}</span> 
                        at Slot <span>${requestScope.ses.timeslot.id}</span> 
                        on <span>${requestScope.ses.date}</span>, in room
                        <span>${requestScope.ses.room.name}</span> at FU-HL
                        <br/>
                        Attended: 
                        <c:if test="${requestScope.ses.attanded}">
                            <span class="padding-text green">YES</span>
                        </c:if>
                        <c:if test="${!requestScope.ses.attanded}">
                            <span class="padding-text red">NO</span>
                        </c:if>
                    </p>
                </div>

                <div class="table">
                    <form action="takeatt" method="POST">
                        <input type="hidden" name="sesid" value="${param.id}"/>

                        <table border="1px">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Code</th>
                                    <th>Full Name</th>
                                    <th>Present</th>
                                    <th>Absent</th>
                                    <th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.ses.attandances}" var="a" varStatus="loop">
                                    <tr>
                                        <td>${loop.index+1}</td>
                                        <td>${a.student.code}
                                            <input type="hidden" name="stdid" value="${a.student.id}"/>
                                        </td>
                                        <td>${a.student.name}</td>
                                        <td><input type="radio"
                                                   <c:if test="${a.present}">
                                                       checked="checked"
                                                   </c:if>
                                                   name="present${a.student.id}" value="present" /></td>
                                        <td><input type="radio"
                                                   <c:if test="${!a.present}">
                                                       checked="checked"
                                                   </c:if>
                                                   name="present${a.student.id}" value="absent" /></td>
                                        <td><input type="text" name="description${a.student.id}" value="${a.description}" class="description"/></td>
                                    </tr>   
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="save-button">
                            <input type="submit" value="Save"/>
                        </div>
                    </form>
                </div>

            </div>
            <footer>
                <p class="line-1"><span class="bold-letter">Mọi góp ý, thắc mắc xin liên hệ:</span> Phòng dịch vụ sinh viên: Email: <a href="#">dichvusinhvien@fe.edu.vn.</a> Điện thoại: <span class="bold-letter">(024)7308.13.13</span></p>
                <p class="line-2">&copy; Powered by <a href="#">FPT University</a> |  <a href="#">CMS</a> |  <a href="#">library</a> |  <a href="#">books24x7</a></p>
            </footer>
        </div>
    </body>
</html>
