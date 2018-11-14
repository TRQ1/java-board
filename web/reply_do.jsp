<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 10. 8.
  Time: AM 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dao.BoardDao" %>
<%@ page import="vo.BoardVo" %>
<%@ page import="java.util.ArrayList" %>
<%@include file="include/common.jsp"%>
<%
    BoardDao boardDao = new BoardDao();

    int idx = Integer.parseInt(request.getParameter("id"));
    ArrayList<BoardVo> getList = boardDao.sqlGetList(idx);
    int size = getList.size()-1;
    BoardVo lists = getList.get(size);
    int indent = lists.getIndent();
    int parent = lists.getParent();
    int step = lists.getStep();
    boardDao.sqlReplySortUpdate(parent, step);
    boardDao.sqlReplyInsert(request, response, "comment", parent, indent, step, idx);
%>
