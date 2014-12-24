<%-- 
    Document   : tran-tag
    Created on : Dec 6, 2014, 2:17:58 AM
    Author     : earthzy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@attribute name="transection" required="true" rtexprvalue="true" type="java.util.List" %>
<%@include file="../../header.html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="z" %>

<table class="table table-bordered">
    <c:set var="count" value="1" scope="page" />
    <tr>
        
        <td><b>ID</b></td>
        <td><b>Code</b></td>
        <td><b>Date</b></td>
        <td><b>Amount</b></td>
    </tr>
    <c:forEach items="${transection}" var="t">
        <tr>
            <td>${t.getTransactionId()}</td>
            <td>${t.getTransactionCode()}</td>
            <td>${t.getTransactionDateTime()}</td>
            <td><z:formatNumber>${t.getAmount()}</z:formatNumber></td>
        </tr>
    </c:forEach>
</table>
