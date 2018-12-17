<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 9. 18.
  Time: PM 7:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="utils.PagingUtil" %>
<%@ page import="utils.CheckLength" %>
<%@ page import="dao.BoardDao"%>
<%@ page import="vo.PagingVo" %>
<%@ page import="vo.BoardVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="include/session.jsp"%>
<%

    PagingVo pagingVo = new PagingVo();

    CheckLength checkLength = new CheckLength();
    BoardDao boardDao = new BoardDao();

    int id = 0;
    int pg = 1;

    if(request.getParameter("pg") != null) {
        pg = Integer.parseInt(request.getParameter("pg"));
    }

    PagingUtil pagingUtil = new PagingUtil();
    pagingUtil.setPaging(pagingVo, pg, 5, 6);
    int endPage = pagingVo.getEndPage();
    int startPage = pagingVo.getStartPage();
    int pageSize = pagingVo.getPageSize();
    int countPage = pagingVo.getCountPage();
    int end = pagingVo.getEnd();


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>게시판</title>
</head>
<body>
<%

    int total = boardDao.sqlCount();
    int allPage = (int)Math.ceil(total / (double)pageSize); // 전체 게시물 갯수와 페이지에 보여야할 갯수를 나누어서 필요한 전체 페이지 수를 구한다. 나눠진 값에대해 자리 올림을 하여 필요 페이지수를 구한다.

    if(endPage > allPage) { //마지막 페이지가 모든 페이지 값보다 클시에 마지막 페이지는 총 페이지 수로 대체
        endPage = allPage;
    }

%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr style="text-align:center;">
        <td width="5"></td>
        <td width="20">번호</td>
        <td width="200">제목</td>
        <td width="50">글쓴이</td>
        <td width="60">등록일</td>
        <td width="7"></td>
    </tr>
    <%
    if(total == 0) { // total 값이 0일 경우 등록된 글이 없음 출력
    %>
    <tr align="center" bgcolor="#FFFFFF" height="30">
        <td colspan="6">등록된 글이 없습니다.</td>
    </tr>
    <%
    } else {

        ArrayList<BoardVo> voList = boardDao.sqlBoardList(request, boardCode);

        for(int i = pageSize * (pg - 1) ; i < end; i++) {
            BoardVo boardVo = voList.get(i);
            id = boardVo.getId();
            int indent = boardVo.getIndent();
            String beforeTilte = boardVo.getTitle();
            String title = checkLength.checkString(beforeTilte);
            String author = boardVo.getAuthor();
            Date todate = boardVo.getTodate();
            int commentCount = boardVo.getCommentCnt();
            String postStatus = boardVo.getPostStatus();
    %>
    <tr height="25" align="center">
        <td>&nbsp;</td>
        <td><%=id %></td>
        <td align="left">
            <%
                for (int j = 0; j < indent; j++) {
            %>
            &nbsp;&nbsp;&nbsp;
            <%
                }
                if (indent != 0) {
                }

            %>
            <%
                if (postStatus == null && commentCount != 0) {
            %>
            <a href="detail.jsp?id=<%=id%>&pg=<%=pg%>"><%=title %> (<%=commentCount%>)
            <%
                } else if(postStatus == null && commentCount == 0) {
            %>
                <a href="detail.jsp?id=<%=id%>&pg=<%=pg%>"><%=title %>
            <%
                } else if (postStatus.equals("deleted") && commentCount != 0) {
            %>
                    <a href="lists.jsp?=id=<%=id%>&pg=<%=pg%>" onClick="alert('삭제된 글입니다.')"><%=title %>
                        (<%=commentCount%>)
            <%
                } else if (postStatus.equals("deleted") && commentCount == 0) {
            %>
                        <a href="lists.jsp?=id=<%=id%>&pg=<%=pg%>" onClick="alert('삭제된 글입니다.')"><%=title %>
            <%
                }
            %>
        </td>
        <td align="center"><%=author %></td>
        <td align="center"><%=todate %></td>
        <td>&nbsp;</td>
    </tr>
    <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
    <%
        }
    %>
    <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td colspan="4" height="5"></td></tr>
    <tr>
        <td align="center">
            <%
                if(pg > countPage) {
            %>
            [<a href="lists.jsp?pg=1">◀◀</a>]
            [<a href="lists.jsp?pg=<%=startPage-1%>">◀</a>]
            <%
                }
            %>

            <%
                for(int i=startPage; i<= endPage; i++){ // 시작페이지부터 마지막페이지까지 하나씩 증가를 하고 출력 하고 해당 숫자의 페이징을 호출하여 해당 게시물로 동
                    if(i == pg){
            %>
            <u><b>[<%=i %>]</b></u>
            <%
            }else{
            %>
            [<a href="lists.jsp?pg=<%=i%>"><%=i %></a>]
            <%
                    }
                }
            %>

            <%
                if(endPage < allPage){  // 마지막 페이지가 모든 페이지보다 낮을 경우에는 다음을 눌렀을때 마지막 페이지 + 1을 값으로 페이징을 호출,
            %>
            [<a href="lists.jsp?pg=<%=endPage+1%>">▶</a>]
            [<a href="lists.jsp?pg=<%=allPage%>">▶▶</a>]
            <%
                }
                }
            %>
        </td>
    </tr>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td colspan="4" height="5"></td></tr>
    <tr align="right">
        <td><input type=button value="글쓰기"
                   OnClick="window.location='write.jsp?id=<%=id%>&pg=<%=pg%>'"></td>
    </tr>
</table>
</table>
</body>
</html>