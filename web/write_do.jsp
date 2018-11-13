<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 9. 19.
  Time: PM 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="utils.CookieUtils"%>
<%@ page import="dao.BoardDao" %>
<%@ page import="dao.UserDao" %>
<%
    request.setCharacterEncoding("UTF-8");

    CookieUtils cookieUtils = new CookieUtils();
    String loginId = cookieUtils.checkLogin(request, "loginId");
    BoardDao boardDao = new BoardDao();
    UserDao userDao = new UserDao();

    int id = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));
    String userId = loginId;

    /**
     * 회원 로그인시 작성자와 패스워드를 안받기때문에 처리 해주는 로직
     */

    String author = request.getParameter("author");
    String password = request.getParameter("password");
    if (author == null && password == null) {
        author = userId;
    }

    int max = boardDao.sqlBoardMax();
    int count = boardDao.sqlCount();
    boardDao.sqlInsert(request, "post", max);
    int countAfter = boardDao.sqlCount();

    if (count + 1 == countAfter) {
%>
<script language=javascript>
    self.window.alert("입력한 글을 저장하였습니다.");
    location.href = "lists.jsp?id=<%=id%>&pg=<%=pg%>";
</script>
<%
    }
%>