<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 10. 8.
  Time: AM 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="utils.CookieUtils"%>
<%@ page import="dao.BoardDao" %>
<%@ page import="dao.UserDao" %>
<%@ page import="vo.BoardVo" %>
<%@ page import="java.util.ArrayList" %>
<%
    request.setCharacterEncoding("UTF-8");

    CookieUtils cookieUtils = new CookieUtils();
    String userId = cookieUtils.checkLogin(request, "loginId");
    UserDao userDao = new UserDao();
    BoardDao boardDao = new BoardDao();

    int idx = Integer.parseInt(request.getParameter("id"));
    String author = request.getParameter("author");
    String password = request.getParameter("password");

    if (author == null && password == null) {
        author = userId;
        password = userDao.sqlGetPasswd(userId);
    }

    int count = 0;
    int countAfter = 0;

    ArrayList<BoardVo> getList = boardDao.sqlGetList(idx);
    int size = getList.size()-1;
    BoardVo lists = getList.get(size);
    int indent = lists.getIndent();
    int parent = lists.getParent();
    int step = lists.getStep();
    count = boardDao.sqlCount();
    boardDao.sqlReplySortUpdate(parent, step);
    boardDao.sqlReplyInsert(request, "comment", parent, indent, step);
    countAfter = boardDao.sqlCount();
    if (count + 1 == countAfter) {
%>
<script language=javascript>
    self.window.alert("입력한 글을 저장하였습니다.");
    location.href = "lists.jsp";
</script>
<%
    }
%>
