<%-- 
    Document   : timetableStu
    Created on : Nov 8, 2022, 9:35:15 AM
    Author     : bonne
--%>

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
                    <a href="#" >${sessionScope.account.displayName}</a>
                    <span>|</span>
                    <a href="../logout">logout</a>
                    <span>|</span>
                    <span class="campus">CAMPUS: FPTU-H??a L???c</span>
                </div>
            </nav>
            <div class="content">
                <div class="note">
                    <h2 class="thin-letter">Activities for ${requestScope.student.name}</h2>
                    <p><span class="bold-letter">Note:</span> These activities do not include extra-curriculum activities, such as club activities ... </p>
                    <p><span class="bold-letter">Ch?? th??ch:</span> C??c ho???t ?????ng trong b???ng d?????i kh??ng bao g???m ho???t ?????ng ngo???i kh??a, v?? d??? nh?? ho???t ?????ng c??u l???c b??? ... </p>
                    <p>    
                        C??c ph??ng b???t ?????u b???ng AL thu???c t??a nh?? Alpha. VD: AL...<br/>
                        C??c ph??ng b???t ?????u b???ng BE thu???c t??a nh?? Beta. VD: BE,..<br/>
                        C??c ph??ng b???t ?????u b???ng G thu???c t??a nh?? Gamma. VD: G201,...<br/>
                        C??c ph??ng t???p b???ng ?????u b???ng R thu???c khu v???c s??n t???p Vovinam.<br/>
                        C??c ph??ng b???t ?????u b???ng DE thu???c t??a nh?? Delta. VD: DE,..<br/>
                        Little UK (LUK) thu???c t???ng 5 t??a nh?? Delta
                    </p>
                </div>
                <div class="table">
                    <table>
                        <thead>
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
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <th>${helper.getDayNameofWeek(d)}</th>
                                    </c:forEach>
                            </tr>
                            <tr>
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <th>${d}</th>
                                    </c:forEach>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${requestScope.slots}" var="slot">
                                <tr>
                                    <td>SLOT ${slot.id}</td>
                                    <c:forEach items="${requestScope.dates}" var="d">
                                        <td>
                                            <c:forEach items="${requestScope.sessions}" var="ses">
                                                <div class="slot">
                                                    <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                                        
                                                            <a class="course" href="#">${ses.group.name}-${ses.group.subject.name}</a>
                                                        

                                                        <br/>
                                                        at <span class="room">${ses.room.name}</span>
                                                        <br/>
                                                        <a href="#" class="materials padding-text yellow">View&nbsp;Materials</a>
                                                        <br/>
                                                        <c:if test="${ses.attanded}">
                                                            (<font color="green">Attended</font>)
                                                        </c:if>

                                                        <c:if test="${!ses.attanded}">
                                                            <c:if test="${helper.getDaystoCurrent(ses.getDate()) < 0}">
                                                                (<font color="red">Not yet</font>)
                                                            </c:if>
                                                            <c:if test="${helper.getDaystoCurrent(ses.getDate()) >= 0}">
                                                                (<font color="red">Absent</font>)
                                                            </c:if>
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
                    <p class="bold-letter"> More note / Ch?? th??ch th??m: </p>
                    <ul>
                        <li>(<font color="green">attended</font>): ${requestScope.student.name} had attended this activity / ${requestScope.student.name} ???? tham gia ho???t ?????ng n??y</li>
                        <li>(<font color="red">absent</font>): ${requestScope.student.name} had NOT attended this activity / ${requestScope.student.name} ???? v???ng m???t bu???i n??y</li>
                        <li>(-): no data was given / ch??a c?? d??? li???u</li>
                    </ul>
                </div>
            </div>

            <footer>
                <p class="line-1"><span class="bold-letter">M???i g??p ??, th???c m???c xin li??n h???:</span> Ph??ng d???ch v??? sinh vi??n: Email: <a href="#">dichvusinhvien@fe.edu.vn.</a> ??i???n tho???i: <span class="bold-letter">(024)7308.13.13</span></p>
                <p class="line-2">&copy; Powered by <a href="#">FPT University</a> |  <a href="#">CMS</a> |  <a href="#">library</a> |  <a href="#">books24x7</a></p>
            </footer>
        </div>
    </body>
</html>
