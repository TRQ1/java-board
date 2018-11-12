<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 10. 16.
  Time: AM 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="utils.CookieUtils"%>
<%@ page import="dao.CommentDao" %>
<%
    request.setCharacterEncoding("UTF-8");
    CommentDao commentDao = new CommentDao();
    CookieUtils cookieUtils = new CookieUtils();
    String loginId = cookieUtils.checkLogin(request, "loginId");

    int count = 0;
    int countAfter = 0;

    int idx = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));

    count = commentDao.sqlCountComment(idx);
    commentDao.sqlInsertAccountCommnet(request, idx);
    countAfter = commentDao.sqlCountComment(idx);

    if (count + 1 == countAfter) {
%>
<script language=javascript>
    self.window.alert("입력한 글을 저장하였습니다.");
    location.href = "detail.jsp?id=<%=idx%>&pg=<%=pg%>";
</script>
<%
        System.out.println("done");
    }
%>
