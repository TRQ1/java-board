<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 9. 20.
  Time: AM 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVo" %>
<%@ page import="dao.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<%
    request.setCharacterEncoding("UTF-8");
    BoardDao boardDao = new BoardDao();

    String password = "";
    int idx = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));
    String pass = request.getParameter("password");
    System.out.println(pass);
    password = boardDao.sqlPasswd(idx);
    System.out.println(password);
    if (password.equals(pass)) {
        response.sendRedirect("modify.jsp?id=" + idx + "&pg=" + pg );
    } else {
%>
<script language=javascript>
    self.window.alert("비밀번호를 틀렸습니다.");
    location.href="javascript:history.back()";
</script>
<%
    }
%>
