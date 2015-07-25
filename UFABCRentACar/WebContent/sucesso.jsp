<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultado</title>
<style type="text/css">
body {
	border: none;
	padding: 0px 0px 0px 0px;
	margin: 0px 0px 0px 0px;
}
</style>

</head>
<body>

	<jsp:include page="cabecalho.jsp" />

	<h3>Mensagem:</h3>
	${requestScope.msg}
	<br>
	<br>
	<a href="index.jsp">Voltar</a>
	
	<div style="position: absolute; bottom: 0; margin: 0; width: 100%" >
		<jsp:include page="rodape.jsp" />
	</div>
</body>
</html>