<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 9. 20.
  Time: AM 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dao.CommentDao" %>
<%
    request.setCharacterEncoding("UTF-8");

    int idx = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));
    String content = request.getParameter("content");
    String pass = request.getParameter("password");
    String author = request.getParameter("author");

    CommentDao commentDao = new CommentDao();

    int id = commentDao.sqlSelectCommentId(content, idx);
    String password = commentDao.sqlCommentPasswd(id);
    if (password.equals(pass)) {
        response.sendRedirect("comment_modify.jsp?id=" + idx + "&pg=" + pg + "&cid=" + id + "&author=" + author);
    } else {
%>
<script language=javascript>
    self.window.alert("비밀번호를 틀렸습니다.");
    location.href = "javascript:history.back()";
</script>
<%
    }
%>
