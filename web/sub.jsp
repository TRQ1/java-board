<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 21/11/2018
  Time: 1:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int bc = Integer.parseInt(request.getParameter("bc"));
    if(bc == 0) {
%>
<jsp:include page="lists.jsp">
    <jsp:param name="bc" value="0"/>
</jsp:include>
<%
    } else if(bc != 0) {
%>
<jsp:include page="lists.jsp?id=" >
    <jsp:param name="bc" value="<%=bc%>"/>
</jsp:include>
<%
    }
%>
