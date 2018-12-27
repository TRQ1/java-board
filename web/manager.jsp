<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 21/11/2018
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="include/session.jsp" %>
<%@ include file="include/common.jsp" %>
<%@ page import="vo.BoardViewVo" %>
<%@ page import="dao.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<html>
<body>
<table cellspacing="0" cellpadding="0" border="1">
    <tr>
        <th style="padding:5,10,5,10">게시판 이름</th>
        <th style="padding:5,5,5,5">로그인 전용</th>
        <th style="padding:5,5,5,5">관리자 전용</th>
        <th style="padding:5,5,5,5">댓글 사용</th>
        <th style="padding:5,5,5,5">답글 사용</th>
        <th style="padding:5,5,5,5">수정</th>
    </tr>
        <tr>
            <%
                int totalBoard = new BoardDao().boardListCount();
                ArrayList<BoardViewVo> configList = new BoardDao().boardConfigList();
                for (int i = 0; i < totalBoard; i++) {
                    BoardViewVo boardViewVo = configList.get(i);
                    String boardName = boardViewVo.getBoardName();
            %>
         <form method="POST" action="boardConfigEdit.jsp" style="margin:0">
            <td align="center"><%=boardName%>
            </td>
            <td align="center">
                <input type="checkbox" name="login" value="1" checked />
                <input type="hidden" name="login" value="0" />
            </td>
            <td align="center">
                <input type="checkbox" name="admin" value="1" checked>
                <input type="hidden" name="admin" value="0" />
            </td>
            <td align="center">
                <input type="checkbox" name="comment" value="1" checked>
                <input type="hidden" name="comment" value="0" />
            </td>
            <td align="center">
                <input type="checkbox" name="reply" value="1" checked>
                <input type="hidden" name="reply" value="0" />
            </td>
            <td align="center">
                <input type="submit" value="수정">
            </td>
            </form>
            </tr>
             <%
                 }
             %>
</table>

<br>
<table cellspacing="0" cellpadding="0" border="1">
    <form name=addboardform method="post" action="boardConfigAdd.jsp">
    <tr>
        <th style="padding:5,10,5,10">게시판 이름</th>
        <th style="padding:5,5,5,5">로그인 전용</th>
        <th style="padding:5,5,5,5">관리자 전용</th>
        <th style="padding:5,5,5,5">댓글 사용</th>
        <th style="padding:5,5,5,5">답글 사용</th>
        <th style="padding:5,5,5,5">추가</th>
    </tr>
    <td>
        <input type="text" name="boardName" style="width:100">
    </td>
    <td align="center">
        <input type="checkbox" name="login" value="1" />
        <input type="hidden" name="login" value="0" />
    </td>
    <td align="center">
        <input type="checkbox" name="admin" value="1"/>
        <input type="hidden" name="admin" value="0" />
    </td>
    <td align="center">
        <input type="checkbox" name="comment" value="1"/>
        <input type="hidden" name="comment" value="0" />
    </td>
    <td align="center">
        <input type="checkbox" name="reply" value="1"/>
        <input type="hidden" name="reply" value="0" />
    </td>
    <td align="center">
        <input type="submit" value="추가">
    </td>
    </form>
</table>
</body>
</html>
