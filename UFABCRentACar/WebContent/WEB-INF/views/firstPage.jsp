<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
<style>
body {
	margin: 0px 0px 0px 0px;
	border: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}

a {
	color: yellow;
	font: bold;
}

form {
	width: auto;
	height: auto;
}
.registerForm {
	float: left;
	margin-left: 20%;
	width: 600px;
	clear: both;
}

.registerForm input {
	width: 100%;
	clear: both;
}
</style>
<script type="text/javascript">
		
	</script>

</head>
<body>
<<<<<<< HEAD
	
	<jsp:include page="cabecalho.jsp" />

	<div class="veiculos">
		<a href="cadastroVeiculo">Cadastrar Novo Veículo</a>
	
		<table border=1>
			<tr>
				<td><b>Nome</b></td>
				<td><b>Marca</b></td>
				<td><b>Ano</b></td>
				<td><b>Kilometragem</b></td>
			</tr>
			<c:forEach items="${veiculos}" var="veiculo">
				<tr>
					<td>${veiculo.nome}</td>
					<td>${veiculo.marca}</td>
					<td>${veiculo.ano}</td>
					<td>${veiculo.kilometragem}</td>
				</tr>
			</c:forEach>
		</table>	
		
	</div>
	<jsp:include page="rodape.jsp" />
=======
<h3>Take a Ride</h3>
<div class="container-fluid">
	<button alt="Adicionar nova carona"></button>
	
</div>
<div class="container-fluid">


</div>
>>>>>>> origin/master
</body>
</html>