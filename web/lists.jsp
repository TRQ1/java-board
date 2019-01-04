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
<%@ page import="dao.UserDao" %>
<%@ include file="include/session.jsp"%>
<%
    try {
    PagingVo pagingVo = new PagingVo();

    CheckLength checkLength = new CheckLength();
    BoardDao boardDao = new BoardDao();

    int id = 0;
    int pg = 0;
    int bc = 0;
    int opt = 0;
    String condition = null;

    id = Integer.parseInt(request.getParameter("id"));
    bc = Integer.parseInt(request.getParameter("bc"));

    if(request.getParameter("bc") != null) {
        bc = Integer.parseInt(request.getParameter("bc"));
    } else if(bc == 0){
        bc = new UserDao().getAuth(userId);
    }

    if(request.getParameter("pg") != null) {
        pg = Integer.parseInt(request.getParameter("pg"));
    }

    if (request.getParameter("opt") != null){
        opt = Integer.parseInt(request.getParameter("opt"));
    }
    if (request.getParameter("condition") != null){
        condition = request.getParameter("condition");
    }
    System.out.println(opt);
    System.out.println(condition);

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

    ArrayList<BoardVo> voList = boardDao.sqlBoardList(request, bc);
    if(voList == null || voList.size() <=0 ) { // total 값이 0일 경우 등록된 글이 없음 출력
    %>
    <tr align="center" bgcolor="#FFFFFF" height="30">
        <td colspan="6">등록된 글이 없습니다.</td>
    </tr>
    <%
    } else {
        for(int i = pageSize * (pg - 1); i < end; i++) {
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
            <a href="index.jsp?id=<%=id%>&pg=<%=pg%>&bc=<%=bc%>&d=1"><%=title %> (<%=commentCount%>)
            <%
                } else if(postStatus == null && commentCount == 0) {
                    System.out.println(id);
            %>
                <a href="index.jsp?id=<%=id%>&pg=<%=pg%><%=bc%>&d=1""><%=title %>
            <%
                } else if (postStatus.equals("deleted") && commentCount != 0) {
            %>
                    <a href="index.jsp?id=<%=id%>&pg=<%=pg%>" onClick="alert('삭제된 글입니다.')"><%=title %>
                        (<%=commentCount%>)
            <%
                } else if (postStatus.equals("deleted") && commentCount == 0) {
            %>
                        <a href="index.jsp?id=<%=id%>&pg=<%=pg%>" onClick="alert('삭제된 글입니다.')"><%=title %>
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
            [<a href="index.jsp?pg=1&bc=<%=bc%>">◀◀</a>]
            [<a href="index.jsp?pg=<%=startPage-1%>&bc=<%=bc%>">◀</a>]
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
            [<a href="index.jsp?pg=<%=i%>&bc=<%=bc%>"><%=i %></a>]
            <%
                    }
                }
            %>

            <%
                if(endPage < allPage){  // 마지막 페이지가 모든 페이지보다 낮을 경우에는 다음을 눌렀을때 마지막 페이지 + 1을 값으로 페이징을 호출,
            %>
            [<a href="index.jsp?pg=<%=endPage+1%>&bc=<%=bc%>">▶</a>]
            [<a href="index.jsp?pg=<%=allPage%>&bc=<%=bc%>">▶▶</a>]
            <%
                }
                }
            %>
        </td>
    </tr>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td colspan="4" height="5"></td></tr>
    <tr align="center">
        <br>
        <div id="searchForm">
            <form name=searchForm method=post action=index.jsp?id=<%=id%>&pg=<%=pg%>&bc=<%=bc%>>
                <select name="opt">
                    <option value="1">제목</option>
                    <option value="2">내용</option>
                    <option value="3">제목+내용</option>
                    <option value="4">글쓴이</option>
                </select>
                <input type="text" size="20" name="condition"/>&nbsp;
                <input type="submit" value="검색"/>
            </form>
        </div>
        </div>
    </tr>
    <tr align="right">
        <td><input type=button value="글쓰기"
                   OnClick="window.location='index.jsp?id=<%=id%>&pg=<%=pg%>&bc=<%=bc%>&w=1'"></td>
    </tr>
</table>
</table>
</body>
</html>
<%
    } catch (Exception e) {
        System.out.println("e: " + e);
    }
%>
