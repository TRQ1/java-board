<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 9. 20.
  Time: AM 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDao" %>
<%
    request.setCharacterEncoding("UTF-8");

    int idx = Integer.parseInt(request.getParameter("id"));
    String pass = request.getParameter("password");
    BoardDao boardDao = new BoardDao();

    String password = boardDao.sqlPasswd(idx);

    if (password.equals(pass)) {
        boardDao.sqlPostDelete(idx);
%>
<script language=javascript>
    self.window.alert("해당 글을 삭제하였습니다.");
    location.href="lists.jsp";
</script>
<%
        } else {
%>
<script language=javascript>
    self.window.alert("비밀번호를 틀렸습니다.");
    location.href="javascript:history.back()";
</script>
<%
        }
%>

