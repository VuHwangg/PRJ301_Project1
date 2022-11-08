
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Timetable</title>

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
                    <span class="bold-letter">View Schedule</span>
                </div>
                <div class="nav-right bold-letter">
                    <a href="#" >${requestScope.lecturer.name}</a>
                    <span>|</span>
                    <a href="../logout">logout</a>
                    <span>|</span>
                    <span class="campus">CAMPUS: FPTU-Hòa Lạc</span>
                </div>
            </nav>
            <div class="content">
                <div class="lecturer-box">Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/></div>
                <div class="table">
                    <table>
                        <thead>
<!--                            First row-->
                            <tr>
                                <th rowspan="2">
                                    <form action="timetable" method="GET">
                                        <table class="second-table">
                                            <tr>
                                                <td>From </td>
                                                <td><input class="date" type="date" name="from" value="${requestScope.from}"/></td>
                                                <td rowspan="2"><input class="view-button" type="submit" value="View"/> </td>
                                            </tr>
                                            <tr>
                                                <td>To </td>
                                                <td><input class="date" type="date" name="to" value="${requestScope.to}"/></td>
                                            </tr>
                                        </table>
                                    </form>
                                </th>
<!--                                Loop cell of first row 1th-->
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <th>${helper.getDayNameofWeek(d)}</th>
                                </c:forEach>
                            </tr>
                            <tr>
<!--                                Loop cell of first row 2th-->
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <th>${d}</th>
                                </c:forEach>
                            </tr>
                        </thead>

                        <tbody>
<!--                        Loop row: the rest of the rows-->
                            <c:forEach items="${requestScope.slots}" var="slot">
                                <tr>
<!--                                First cell of row-->
                                    <td>SLOT ${slot.id}</td>
<!--                                Loop cell of this row-->
                                    <c:forEach items="${requestScope.dates}" var="d">
                                        <td>
<!--                                        Loop run all sessions in array list-->
                                            <c:forEach items="${requestScope.sessions}" var="ses">
                                                <div class="slot">
<!--                                                If "Date" and "Slot" of this session in list is equal with
                                                    cell session (based on row and col). Display this session info-->
                                                    <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                                        <c:if test="${helper.getDaystoCurrent(ses.getDate()) >= 0}">
                                                            <a class="course" href="takeatt?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                                        </c:if>
                                                        <c:if test="${helper.getDaystoCurrent(ses.getDate()) < 0}">
                                                            <span class="course">${ses.group.name}-${ses.group.subject.name}</span>
                                                        </c:if>
                                                        
                                                        <br/>
                                                        at <span class="room">${ses.room.name}</span>
                                                        <br/>
                                                        <a href="#" class="materials padding-text yellow">View&nbsp;Materials</a>
                                                        <br/>
                                                        <c:if test="${ses.attanded}">
                                                            (<font color="green">Present</font>)
                                                        </c:if>
                                                         
                                                        <c:if test="${!ses.attanded}">
                                                            (<font color="red">Not yet</font>)
                                                        </c:if>
                                                        <br/>
                                                        <span class="time padding-text green">${slot.description}</span>
                                                    </c:if>
                                                </div>
                                            </c:forEach>
                                        </td>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="more-note">
                    <p class="bold-letter"> More note / Chú thích thêm: </p>
                    <ul>
                        <li>(<font color="green">attended</font>): ${requestScope.lecturer.name} had attended this activity / ${requestScope.lecturer.fullname} đã tham gia hoạt động này</li>
                        <li>(<font color="red">absent</font>): ${requestScope.lecturer.name} had NOT attended this activity / ${requestScope.lecturer.fullname} đã vắng mặt buổi này</li>
                        <li>(-): no data was given / chưa có dữ liệu</li>
                    </ul>
                </div>
            </div>

            <footer>
                <p class="line-1"><span class="bold-letter">Mọi góp ý, thắc mắc xin liên hệ:</span> Phòng dịch vụ sinh viên: Email: <a href="#">dichvusinhvien@fe.edu.vn.</a> Điện thoại: <span class="bold-letter">(024)7308.13.13</span></p>
                <p class="line-2">&copy; Powered by <a href="#">FPT University</a> |  <a href="#">CMS</a> |  <a href="#">library</a> |  <a href="#">books24x7</a></p>
            </footer>
        </div>
    </body>
</html>
