<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 10. 24.
  Time: AM 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dao.BoardDao" %>
<%@ include file="include/common.jsp"%>
<%
    int idx = Integer.parseInt(request.getParameter("id"));
    BoardDao boardDao = new BoardDao();
    boardDao.sqlPostDelete(idx);
%>
<script language=javascript>
    self.window.alert("해당 글을 삭제하였습니다.");
    location.href = "index.jsp";
</script>
<%
%>
