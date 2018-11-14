<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 9. 19.
  Time: PM 5:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date"%>
<%@ page import="utils.CookieUtils"%>
<%@ page import="vo.BoardVo" %>
<%@ page import="dao.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.CommentDao" %>
<%@ page import="vo.CommentVo" %>
<%@include file="include/common.jsp"%>
<%
    BoardDao boardDao = new BoardDao();
    CommentDao commentDao = new CommentDao();
    String userId = new CookieUtils().checkLogin(request, "loginId");
    int idx = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));

    int cid = 0;
    String author = null;
    String title = null;
    String content = null;
    int commentTotal =  0;

    ArrayList<BoardVo> boardList = boardDao.sqlBoardDetailList(idx);
    int size = boardList.size()-1;
    BoardVo boardVo = boardList.get(size);
    author = boardVo.getAuthor();
    title = boardVo.getTitle();
    content = boardVo.getContent();
    commentTotal = boardVo.getCommentCnt();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>글 상세</title>
</head>
<body>
<table>
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr style="text-align:center;">
                    <td width="5"></td>
                    <td>글 상세</td>
                    <td width="5"></td>
                </tr>
            </table>
            <table width="413">
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                    <td width="0">&nbsp;</td>
                    <td align="center" width="76">글쓴이</td>
                    <td width="319"><%=author %></td>
                    <td width="0">&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                    <td width="0">&nbsp;</td>
                    <td align="center" width="76">제목</td>
                    <td width="319"><%=title %>
                    </td>
                    <td width="0">&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                    <td width="0">&nbsp;</td>
                    <td align="center" width="76">내용</td>
                    <td width="319"><%=content %></td>
                    <td width="0">&nbsp;</td>
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
                    <td width="0">&nbsp;</td>
                    <td width="399" colspan="2" height="200">
                </tr>
                <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
                <tr align="right">
                    <td width="0">&nbsp;</td>
                    <td colspan="2" width="399">
                            <%
                           if(userId != null && userId.equals(author)) {
                        %>
                        <input type=button value="수정" name=id
                               OnClick="window.location='modify.jsp?id=<%=idx%>&pg=<%=pg%>'">
                        <input type=button value="삭제" name=id
                               OnClick="window.location='delete_account_do.jsp?id=<%=idx%>&pg=<%=pg%>'">
                        <input type=button value="목록"
                               OnClick="window.location='lists.jsp?pg=<%=pg%>'">
                            <%
                         } else if(userId != null && !userId.equals("null") && !userId.equals(author)) {
                        %>
                        <input type=button value="답글" name=id
                               OnClick="window.location='reply.jsp?id=<%=idx%>&pg=<%=pg%>'">
                        <input type=button value="목록" OnClick="window.location='lists.jsp?pg=<%=pg%>'">
                            <%
                         } else {
                        %>
                        <input type=button value="수정" name=id
                               OnClick="window.location='modify_check.jsp?id=<%=idx%>&pg=<%=pg%>'">
                        <input type=button value="답글" name=id
                               OnClick="window.location='reply.jsp?id=<%=idx%>&pg=<%=pg%>'">
                        <input type=button value="삭제" name=id
                               OnClick="window.location='delete.jsp?id=<%=idx%>&pg=<%=pg%>'">
                        <input type=button value="목록" OnClick="window.location='lists.jsp?pg=<%=pg%>'">
                            <%
                                }
                        %>
                    <td width="0">&nbsp;</td>
                </tr>
            </table>
            <table>
                <%

                        if (userId != null && !userId.equals("null")) {
                %>
                <form name=writecommentcheckform method=post
                      action="write_comment_do.jsp?id=<%=idx%>&pg=<%=pg%>&author=<%=userId%>">
                    <tr>
                        <td align="right" width="76">사용자:</td>
                        <td width="319" name="userId"><%=userId%>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">내용</td>
                        <td><textarea name="contentComment" cols="40" rows="5"></textarea></td>
                        <td align="left" colspan="2" width="200">
                            <input type=submit value="댓글 쓰기">
                        </td>
                    </tr>
                </form>
                <%
                        } else {
                %>
                <form name=writecommentcheckform method=post
                      action="write_vistor_comment_do.jsp?id=<%=idx%>&pg=<%=pg%>">
                    <tr>
                        <td align="right" width="76">사용자:</td>
                        <td><input type="text" name="authorComment" width="319"/></td>
                        <td align="left" width="76">패스워드:</td>
                        <td><input type="password" name="passwdComment" width="319"/></td>
                    </tr>
                    <tr>
                        <td align="center">내용</td>
                        <td><textarea name="contentComment" cols="40" rows="5"></textarea></td>
                        <td align="left" colspan="2" width="200">
                            <input type=submit value="댓글 쓰기">
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </form>
                <tr height="1" bgcolor="#dddddd">
                    <td colspan="2" width="200"></td>
                </tr>
                <tr height="1" bgcolor="#82B5DF">
                    <td colspan="2" width="200"></td>
                </tr>
                <%
                    if (commentTotal == 0) {
                %>
                <tr align="center" bgcolor="#FFFFFF" height="30">
                    <td colspan="6">등록된 글이 없습니다.</td>
                </tr>
                <%
                }
                    ArrayList<CommentVo> commentList = commentDao.sqlBoardDetailList(idx);

                    for(int i = 0; i <= commentTotal - 1; i++) {
                        CommentVo commentVo = commentList.get(i);
                        String authorComment = commentVo.getAuthor();
                        String contentComment = commentVo.getContent();
                        Date todateComment = (Date) commentVo.getTodate();
                %>
                <tr align="left">
                    <td align="left"><%=authorComment%>
                    </td>
                    <td align="left" colspan="1"><%=contentComment%>
                    </td>
                    <td align="right"><%=todateComment%>
                    </td>
                    <%
                        if (userId == null || userId.equals("null")) {
                    %>
                    <td align="right">
                        <input type=button value="댓글 수정"
                               OnClick="window.location='comment_modify_check.jsp?id=<%=idx%>&pg=<%=pg%>&content=<%=contentComment%>&author=<%=authorComment%>'">
                    </td>
                    <td align="right">
                        <input type=button value="댓글 삭제"
                               OnClick="window.location='comment_delete.jsp?id=<%=idx%>&pg=<%=pg%>&content=<%=contentComment%>&cid=<%=cid%>'">

                    </td>
                    <%
                    } else if (userId != null && userId.equals(authorComment)) {
                    %>
                    <td align="right">
                        <input type=button value="댓글 수정"
                               OnClick="window.location='comment_modify.jsp?id=<%=idx%>&pg=<%=pg%>&content=<%=contentComment%>&author=<%=authorComment%>&cid=<%=cid%>'">
                    </td>
                    <td align="right">
                        <input type=button value="댓글 삭제"
                               OnClick="window.location='comment_delete_do.jsp?id=<%=idx%>&pg=<%=pg%>&content=<%=contentComment%>'">
                    </td>
                    <%
                        }
                    %>
                </tr>
                <tr height="1" bgcolor="#dddddd">
                    <td colspan="2" width="200"></td>
                </tr>
                <tr height="1" bgcolor="#82B5DF">
                    <td colspan="2" width="200"></td>
                </tr>
                </form>
                <%
                    }
                %>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
