<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="bootstrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
<style>
body {
	margin: 0px 0px 0px 0px;
	border: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}

a {
	color: blue;
	font: bold;
}

form {
	width: auto;
	height: auto;
}
.veiculos {
	float: left;
	position: relative;
	width: 50%;
	clear: both;
}

.caronas {
	float: left;
	position: relative;
	width: 50%;
	clear: both;
}
</style>
<script type="text/javascript">
		
	</script>

</head>
<body>
	
	<jsp:include page="cabecalho.jsp" />

	<div class="veiculos" style="border: 3px; border-color: black;">
		<a href="cadastroVeiculo">Cadastrar Novo Veículo</a>
	
		<table  class="table table-striped">
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
				<hr size="2px" color="gray" width="800px" align="left" />
			</c:forEach>
		</table>	
	</div>
	<div class="caronas" style="border: 3px; border-color: black;">
		<a href="#">Cadastrar Nova Carona</a>
	
		<table  class="table table-striped">
			<tr>
				<td><b>Vagas</b></td>
				<td><b>Origem</b></td>
				<td><b>Destino</b></td>
				<td><b>Data</b></td>
			</tr>
			<c:forEach items="${caronas}" var="carona">
				<tr>
					<td>${carona.qtd_vagas}</td>
					<td>${carona.partida}</td>
					<td>${carona.destino}</td>
					<td>${carona.data_saida}</td>
				</tr>
				<hr size="2px" color="gray" width="800px" align="left" />
			</c:forEach>
		</table>	
	</div>
	<jsp:include page="rodape.jsp" />
</body>
</html>