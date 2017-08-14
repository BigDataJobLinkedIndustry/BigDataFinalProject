<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="project.bigdata.dto.ResultDTO"%>
<%@ page import="project.bigdata.dao.SearchDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./index.jsp" %>

<%
	List<ResultDTO> list = (List<ResultDTO>)request.getAttribute("list");
%>

<table bordar="1">
	<tr>
		<th>매출</th>
		<th>fc</th>
		<th>fs</th>
		<th>fd</th>
		<th>fhr</th>
		<th>상권</th>
	</tr>
	<%-- <tr>
		<%for(int i=0;i<list.size();i++){
			ResultDTO r = list.get(i);%>
		<td><%= r.getSales() %></td>
		<td><%= r.getFc() %></td>
		<td><%= r.getFs() %></td>
		<td><%= r.getFd() %></td>
		<td><%= r.getFhr() %></td>	
		<td><%= r.getTrdar_cd_nm() %></td>
	</tr>
	<% } %> --%>
	
	<c:forEach items="${ list }" var="search">
		<tr>
			<td>${search.trdar_cd_nm }</td>
			<td>${search.sales }</td>
			<td>${search.fc }</td>
			<td>${search.fs }</td>
			<td>${search.fd }</td>
			<td>${search.fhr }</td>
		</tr>
	</c:forEach>
</table>

result.jsp 결과
</body>
</html>