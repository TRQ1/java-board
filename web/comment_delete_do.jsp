<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 10. 16.
  Time: AM 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dao.CommentDao" %>
<%@ page import="utils.CookieUtils" %>
<%@include file="include/common.jsp"%>
<%
    String userId = new CookieUtils().checkLogin(request, "loginId");
    CommentDao commentDao = new CommentDao();
    if(userId != null && userId.equals("null")){
        commentDao.sqlCommentDelete(request, response);
    } else {
        int idx = Integer.parseInt(request.getParameter("id"));
        String content = request.getParameter("content");
        int id = commentDao.sqlSelectCommentId(content, idx);
        commentDao.sqlAccountCommentDelete(request, response, id);
    }

%>
