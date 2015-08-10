<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="bootstrap.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

.conteudo {
	float: left;
	margin-left: 20%;
	width: 600px;
	clear: both;
}

.pessoa {
	float: center;
	width: 100%;
	padding: 5px 5px 5px 5px;
}
.veiculos {
	float: center;
	width: 100%;
	padding: 5px 5px 5px 5px;
}

.caronas {
	float: center;
	width: 100%;
	padding: 5px 5px 5px 5px;
}
.aluguels{
	float: center;
	width: 100%;
	padding: 5px 5px 5px 5px;
}
.aluguelsSolicitados{
	float: center;
	width: 100%;
	padding: 5px 5px 5px 5px;
}
</style>

</head>
<body>
	
	<jsp:include page="cabecalho.jsp" />
	<div class="conteudo">
	<div class="pessoa">
		<h2>Dados Pessoais</h2>
			Nome: ${pessoa.nome}<br>
			CPF: ${pessoa.cpf}<br>
			Telefone: ${pessoa.telefone}<br>
			Celular: ${pessoa.celular}<br>
			Email: ${pessoa.email}<br>
			RA: ${pessoa.ra}<br>
			Endereço: ${pessoa.logradouro} ${pessoa.numero} ${pessoa.complemento}, ${pessoa.cidade} - ${pessoa.estado}<br>
	
	</div>
	<br>
	<div class="veiculos">
		<h2>Veículos</h2>
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
	
				</c:forEach>
			</table>	
	</div>
	<br>
	<div class="caronas">
		<h2>Caronas</h2>
		<table  class="table table-striped">
				<tr>
					<td id="vagas"><b>Vagas</b></td>
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
					
				</c:forEach>
			</table>	
	</div>
	<br>
	<div class="aluguels">
		<h2>Aluguéis Cedidos</h2>
		<table  class="table table-striped">
				<tr>
					<td><b>Chassi</b></td>
					<td><b>Dono</b></td>
					<td><b>Celular</b></td>
					<td><b>Email</b></td>
					<td><b>Data Inicio</b></td>
					<td><b>Data Devolucao</b></td>
					<td><b>Observacao</b></td>
					<td><b>Locatario</b></td>
					<td><b>Celular Locatario</b></td>
					<td><b>Email Locatario</b></td>
				</tr>
				<c:forEach items="${aluguels}" var="aluguel">
					<tr>
						<td>${aluguel.veiculo.nome}</td>
						<td>${aluguel.pessoa.nome}</td>
						<td>${aluguel.pessoa.celular}</td>
						<td>${aluguel.pessoa.email}</td>
						<td>${aluguel.data_inicio}</td>
						<td>${aluguel.data_devolucao}</td>
						<td>${aluguel.observacao}</td>
						<td>${aluguel.locatario.nome}</td>
						<td>${aluguel.locatario.celular}</td>
						<td>${aluguel.locatario.email}</td>
					</tr>
					
				</c:forEach>
			</table>	
	   </div>
	   <div class="aluguelsSolicitados">
	   <h2>Alugueis Solicitados</h2>
		<table  class="table table-striped">
				<tr>
					<td><b>Chassi</b></td>
					<td><b>Dono</b></td>
					<td><b>Celular</b></td>
					<td><b>Email</b></td>
					<td><b>Data Inicio</b></td>
					<td><b>Data Devolucao</b></td>
					<td><b>Observacao</b></td>
					<td><b>Locatario</b></td>
					<td><b>Celular Locatario</b></td>
					<td><b>Email Locatario</b></td>
				</tr>
				<c:forEach items="${aluguelsSolicitados}" var="aluguelSolicitado">
					<tr>
						<td>${aluguelSolicitado.veiculo.nome}</td>
						<td>${aluguelSolicitado.pessoa.nome}</td>
						<td>${aluguelSolicitado.pessoa.celular}</td>
						<td>${aluguelSolicitado.pessoa.email}</td>
						<td>${aluguelSolicitado.data_inicio}</td>
						<td>${aluguelSolicitado.data_devolucao}</td>
						<td>${aluguelSolicitado.observacao}</td>
						<td>${aluguelSolicitado.locatario.nome}</td>
						<td>${aluguelSolicitado.locatario.celular}</td>
						<td>${aluguelSolicitado.locatario.email}</td>
					</tr>
					
				</c:forEach>
			</table>	
	   </div>
	</div>
</body>
</html>