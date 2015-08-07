<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listagem dos Pessoas</title>
	</head>
	<body>
		<table border=1>
			<tr>
				<td><b>CPF</b></td>
				<td><b>Nome</b></td>
				<td><b>E-mail</b></td>
				<td><b>Celular</b></td>
			</tr>
			<c:forEach items="${pessoas}" var="pessoa">
				<tr>
					<td>${pessoa.cpf}</td>
					<td>${pessoa.nome}</td>
					<td>${pessoa.email}</td>
					<td>${pessoa.celular}</td>
				</tr>
			</c:forEach>
		</table>	
      </body>
</html>