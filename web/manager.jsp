<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 21/11/2018
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <td align="center">
                <form method="POST" action="boardConfigEdit.do" style="margin:0">
            </td>
            <td align="center">
                <input type="checkbox" name="b_login" value="1"
                       checked
                >
            </td>
            <td align="center">
                <input type="checkbox" name="b_admin" value="1"
                       checked
                >
            </td>
            <td align="center">
                <input type="checkbox" name="b_comment" value="1"
                       checked
                >
            </td>
            <td align="center">
                <input type="checkbox" name="b_reply" value="1"
                       checked
                >
            </td>
            <td align="center">
                <input type="submit" value="수정">
                </form>
            </td>
        </tr>
</table>

<br>
<table cellspacing="0" cellpadding="0" border="1">
    <tr>
        <th style="padding:5,10,5,10">게시판 이름</th>
        <th style="padding:5,5,5,5">로그인 전용</th>
        <th style="padding:5,5,5,5">관리자 전용</th>
        <th style="padding:5,5,5,5">댓글 사용</th>
        <th style="padding:5,5,5,5">답글 사용</th>
        <th style="padding:5,5,5,5">추가</th>
    </tr>
    <td>
        <form method="POST" action="boardConfigAdd.do">
            <input type="text" name="b_boardName" style="width:100">
    </td>
    <td align="center">
        <input type="checkbox" name="b_login">
    </td>
    <td align="center">
        <input type="checkbox" name="b_admin">
    </td>
    <td align="center">
        <input type="checkbox" name="b_comment">
    </td>
    <td align="center">
        <input type="checkbox" name="b_reply">
    </td>
    <td align="center">
        <input type="submit" value="추가">
        </form>
    </td>
</table>
</body>
</html>
