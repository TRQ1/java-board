<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 10. 16.
  Time: PM 4:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dao.CommentDao" %>
<%
    request.setCharacterEncoding("UTF-8");
    CommentDao commentDao = new CommentDao();

    int count = 0;
    int countAfter = 0;

    int idx = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));

    count = commentDao.sqlCountComment(idx);
    commentDao.sqlInsertVistorCommnet(request, idx);
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
