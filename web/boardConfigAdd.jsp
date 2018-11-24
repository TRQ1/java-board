<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 24/11/2018
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dao.BoardDao" %>
<%
    BoardDao boardDao = new BoardDao();
    boardDao.addBoardConfigEdit(request);
%>