<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 24/11/2018
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="include/session.jsp"%>
<%@ include file="include/common.jsp"%>
<%@ page import="dao.BoardDao" %>
<%
    System.out.println(request.getParameter("boardName"));
    System.out.println(request.getParameter("login"));
    System.out.println(request.getParameter("admin"));
    System.out.println(request.getParameter("comment"));
    System.out.println(request.getParameter("reply"));
    BoardDao boardDao = new BoardDao();
    boardDao.addBoardConfigEdit(request, response);
%>