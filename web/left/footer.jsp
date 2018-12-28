
<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 21/11/2018
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="../include/common.jsp" %>
<%@include file="../include/session.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.BoardViewVo" %>
<%@ page import="dao.BoardDao" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    Integer pg = 1;
    Integer id = 1;
    if(request.getParameter("pg") != null) {
        pg = Integer.parseInt(request.getParameter("pg"));
    }
    if(request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
    }
%>
<html>
<head>
    <title>게시판 리스트</title>
</head>
<body>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
    <tr style="text-align:center;">
        <td width="200">게시판</td>
    </tr>
    <%
        int totalBoard = new BoardDao().boardListCount();
        ArrayList<BoardViewVo> configList = new BoardDao().boardConfigList();
        for (int i = 0; i < totalBoard; i++) {
            BoardViewVo boardViewVo = configList.get(i);
            int bc = boardViewVo.getBoardCode();
            String boardName = boardViewVo.getBoardName();
    %>
    <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
    <tr height="25" align="center">
        <td width="200"><a href="../index.jsp?id=<%=id%>&pg=<%=pg%>&bc=<%=bc%>"/> <%=boardName%></td>
    </tr>
    <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
    <%
        }
    %>
</table>
</body>
</html>