<%-- 
    Document   : CustomerForm
    Created on : Dec 11, 2014, 1:45:23 PM
    Author     : lfcooh
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="customer" rtexprvalue="true" type="Model.BankAccount"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="z" %>
<div>
    <table class="table">        
        <tr>
            <td>Account ID</td>
            <td>Account Name</td>
            <td>Balance</td>
        </tr>
        <tr>
            <td>${customer.accountId}</td>
            <td>${customer.accountName}</td>
            <td><z:formatNumber>${customer.balance}</z:formatNumber></td>
        </tr>
    </table>
</div>

