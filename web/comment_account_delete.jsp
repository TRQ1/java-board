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

    int idx = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));
    String content = request.getParameter("content");
    CommentDao commentDao = new CommentDao();

    int id = commentDao.sqlSelectCommentId(content, idx);
    commentDao.sqlCommentDelete(id);
%>
<script language=javascript>
    self.window.alert("해당 글을 삭제하였습니다.");
    location.href = "lists.jsp?id=<%=idx%>&pg=<%=pg%>";
</script>

