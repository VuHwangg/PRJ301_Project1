
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/>
        <form action="timetable" method="GET">
            <input type="hidden" name="lid" value="${param.lid}"/>
            From: <input type="date" name="from" value="${requestScope.from}"/>
            To: <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/> 
        </form>
        <table border="1px">
            <!--First row-->
            <tr>
                <!--First cell of first row-->
                <td> </td>
                <!--Loop cell of first row-->
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>${d}<br/>${helper.getDayNameofWeek(d)}</td>
                </c:forEach>
            </tr>
            <!--Loop row: the rest of the rows-->
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <!--First cell of row-->
                    <td>${slot.description}</td>
                    <!--Loop cell of this row-->
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <!--Loop run all sessions in array list-->
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <!--If "Date" and "Slot" of this session in list is equal with
                                    cell session (based on row and col). Display this session info-->
                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                    <a href="att?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                    <br/>
                                    ${ses.room.name}
                                    <c:if test="${ses.attandated}">
                                        <img src="../img/male-icon.png" alt=""/>
                                    </c:if>
                                    <c:if test="${!ses.attandated}">
                                        <img src="../img/female-icon.png" alt=""/>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
