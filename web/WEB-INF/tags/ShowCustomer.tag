<%-- 
    Document   : AccountForm
    Created on : Dec 11, 2014, 12:50:21 PM
    Author     : lfcooh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="Customer Form" pageEncoding="UTF-8"%>
<%@tag body-content="scriptless"%>
<%@attribute name="listOfCustomer" rtexprvalue="true" type="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="z" %>
<div>
    <table class="table">
        <td><b>Account ID<b></td><td><b>Account Name<b></td>
        <td align="right" style="padding-right:110px"><b>Balance</b></td>
</tr>
<c:forEach items="${listOfCustomer}" var="c">
</div>
<tr>            
    <td>${c.accountId} &nbsp; &nbsp; &nbsp; &nbsp; </td>
    <td><a href=search?id=${c.accountId}>${c.accountName}</a></td>
    <td align="right" style="padding-right:110px"><z:formatNumber>${c.balance}</z:formatNumber></td>
</tr>
<c:set var="count" value="${count+1}" scope="page" />
</c:forEach>    
</table>

</div>