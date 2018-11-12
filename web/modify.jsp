<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 9. 20.
  Time: AM 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="utils.CookieUtils"%>
<%@ page import="vo.BoardVo" %>
<%@ page import="dao.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<script language = "javascript">
    function modifyCheck() {
        var form = document.modifyform;

        if(!form.title.value)
        {
            alert( "제목을 적어주세요" );
            form.title.focus();
            return;
        }

        if(!form.content.value)
        {
            alert( "내용을 적어주세요" );
            form.content.focus();
            return;
        }
        form.submit();
    }
</script>
<%
    request.setCharacterEncoding("UTF-8");

    BoardDao boardDao = new BoardDao();
    CookieUtils cookieUtils = new CookieUtils();
    String userId = cookieUtils.checkLogin(request, "loginId");

    String author = "";
    String content = "";
    String title = "";
    String spassword = "";

    int idx = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));
    ArrayList<BoardVo> modifyList = boardDao.sqlModifyBoardList(idx);
    int size = modifyList.size()-1;
    BoardVo modify = modifyList.get(size);
    author = modify.getAuthor();
    content = modify.getContent();
    title = modify.getTitle();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>글 수정</title>
</head>
<body>
<table>
    <form name=modifyform method=post action="modify_do.jsp?id=<%=idx%>&pg=<%=pg%>">
        <tr>
            <td>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr style="text-align:center;">
                        <td width="5"></td>
                        <td>글 수정</td><td width="5"></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">제목</td>
                        <td><input name="title" size="50" maxlength="100" value="<%=title%>"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">글쓴이</td>
                        <td><%=author%> <input name="author" type=hidden size="50" maxlength="50" value="<%=author%>"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <%
                     if (userId.equals(author)) {
                    %>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">내용</td>
                        <td><textarea name="content" cols="50" rows="13"><%=content%></textarea></td>
                        <td>&nbsp;</td>
                    </tr>
                    <%
                        } else {
                    %>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">비밀번호</td>
                        <td><input type="spassword" name="spassword" size="50" maxlength="50"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">내용</td>
                        <td><textarea name="content" cols="50" rows="13"><%=content%></textarea></td>
                        <td>&nbsp;</td>
                    </tr>
                    <%
                        }
                    %>
                    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
                    <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
                    <tr align="right">
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <input type=button value="수정" OnClick="javascript:modifyCheck()">
                        <td>&nbsp;</td>
                    </tr>
                    <tr align="left">
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <input type=button value="취소" OnClick="javascript:history.back(-1)">
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
</table>
</body>
</html>

