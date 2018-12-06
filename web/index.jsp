<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 21/11/2018
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int bc = Integer.parseInt(request.getParameter("bc"));
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<div id="TOP" style="width:960px;height:150px;">
</div>
<table width="960px">
    <tr>
        <td width="160" valign="top">
            <jsp:include page="left.jsp"/>
        </td>
        <td width="1000" valign="top">
            <table witdth="100%" cellpadding="0" cellspacing="0" border="0">
                <%
                    if(bc ==0) {
                %>
                <tr>
                    <jsp:include page="sub.jsp">
                        <jsp:param name="bc" value="0"/>
                    </jsp:include>
                </tr>
                <%
                    } else if (bc != 0) {
                %>
                <tr>
                    <jsp:include page="sub.jsp">
                        <jsp:param name="bc" value="<%=bc%>"/>
                    </jsp:include>
                </tr>
                <%
                    }
                %>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
