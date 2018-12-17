<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 21/11/2018
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
         <form method="POST" action="boardConfigEdit.jsp" style="margin:0">
            <td align="center">
            </td>
            <td align="center">
                <input type="checkbox" name="login" value="1" checked>
            </td>
            <td align="center">
                <input type="checkbox" name="admin" value="1" checked>
            </td>
            <td align="center">
                <input type="checkbox" name="comment" value="1" checked>
            </td>
            <td align="center">
                <input type="checkbox" name="reply" value="1" checked>
            </td>
            <td align="center">
                <input type="submit" value="수정">
            </td>
         </form>
        </tr>
</table>

<br>
<table cellspacing="0" cellpadding="0" border="1">
    <form method="POST" action="boardConfigAdd.jsp">
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
        <input type="checkbox" name="login" value="1">
    </td>
    <td align="center">
        <input type="checkbox" name="admin" value="1">
    </td>
    <td align="center">
        <input type="checkbox" name="comment" value="1">
    </td>
    <td align="center">
        <input type="checkbox" name="reply" value="1">
    </td>
    <td align="center">
        <input type="submit" value="추가">
    </td>
    </form>
</table>
</body>
</html>
