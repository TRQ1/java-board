<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 10. 16.
  Time: AM 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dao.CommentDao" %>
<%
    request.setCharacterEncoding("UTF-8");

    String password = "";
    int idx = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));
    String content = request.getParameter("content");
    String pass = request.getParameter("password");
    String author = request.getParameter("author");
    CommentDao commentDao = new CommentDao();

    int id = Integer.parseInt(request.getParameter("cid"));
    password = commentDao.sqlCommentPasswd(id);

    //password값이랑 파라메터로 받아온 pass값이 같을 경우 글 삭제
    if (password.equals(pass)) {
        commentDao.sqlCommentDelete(id);
%>
<script language=javascript>
    self.window.alert("해당 글을 삭제하였습니다.");
    location.href = "lists.jsp?id=<%=idx%>&pg=<%=pg%>";
</script>
<%
} else {
%>
<script language=javascript>
    self.window.alert("비밀번호를 틀렸습니다.");
    location.href = "javascript:history.back()";
</script>
<%
    }
%>
