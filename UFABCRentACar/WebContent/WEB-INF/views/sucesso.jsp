<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="bootstrap.jsp" />
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

	<h3>Cadastrado com sucesso!</h3>
	<br>
	<br>
	<a href="/UFABCRentACar/">Voltar</a>
	
	<div style="position: absolute; bottom: 0; margin: 0; width: 100%" >
		<jsp:include page="rodape.jsp" />
	</div>
</body>
</html>