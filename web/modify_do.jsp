<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 9. 20.
  Time: PM 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="utils.CookieUtils"%>
<%@ page import="dao.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<%
    request.setCharacterEncoding("UTF-8");

    BoardDao boardDao = new BoardDao();

    int idx = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));

    boardDao.sqlUpdate(request, idx);
    System.out.println();

%>
<script language=javascript>
    self.window.alert("글이 수정되었습니다.");
    location.href = "lists.jsp?pg=<%=pg%>";
</script>
