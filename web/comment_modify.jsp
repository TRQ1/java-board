<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 10. 16.
  Time: PM 5:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dao.CommentDao" %>
<%@ include file="include/session.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id")); // 원래 글의 parent
    int cid = Integer.parseInt(request.getParameter("cid"));  // 댓글 ID
    int pg = Integer.parseInt(request.getParameter("pg"));

    CommentDao commentDao = new CommentDao();

    String content = request.getParameter("content");
    String author = request.getParameter("author"); // 댓글 쓴 사람

    int caId = commentDao.sqlSelectCommentId(content, id);
%>
<html>
<head>
    <title>댓글 수정</title>
</head>
<body>
<table>
    <%
        if (userId.equals(author)) {
    %>
    <form name=commentModifyform method=post
          action="comment_modify_do.jsp?id=<%=id%>&pg=<%=pg%>&author=<%=author%>&cid=<%=caId%>">
        <tr>
            <td align="right" width="76">사용자:</td>
            <td><%=author%>
            </td>
            <td><textarea name="contentComment" cols="40" rows="5"></textarea></td>
            <td align="right">
                <input type=submit value="댓글 수정">
            </td>
        </tr>
            <%
        } else if(userId.equals("null") && author != null){
    %>
        <form name=commentModifyform method=post
              action="comment_modify_do.jsp?id=<%=id%>&pg=<%=pg%>&author=<%=author%>&cid=<%=cid%>">
            <tr>
                <td align="right" width="76">사용자:</td>
                <td><%=author%>
                </td>
                <td><textarea name="contentComment" cols="40" rows="5"></textarea></td>
                <td align="right">
                    <input type=submit value="댓글 수정">
                </td>
            </tr>
            <%
                }
            %>
        </form>
</table>
</body>
</html>
