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

.conteudo{
	width: 100%;
}
.veiculos {
	float: left;
	width: 50%;
	padding: 5px 5px 5px 5px;
}

.caronas {
	float: left;
	width: 50%;
	padding: 5px 5px 5px 5px;
}
</style>
<script type="text/javascript">
$("#btnAluga").click(function() {
    var $vagas = $(this).closest("tr")   // Finds the closest row <tr> 
                       .find("#vagas")     // Gets a descendent with class="nr"
                       .text();         // Retrieves the text within <td>

    $("#vagasCarona").append($item);       // Outputs the answer
});		
</script>

</head>
<body>
	<jsp:include page="cabecalho.jsp" />

	<div class=conteudo>
		<div class="veiculos">
			<a class="btn btn-default" role="button" href="cadastroVeiculo">Cadastrar Novo Veículo</a>
			<a class="btn btn-default" role="button" href="meusDados">Meus Dados</a>
			<br/><br/>
			<table  class="table table-striped">
				<tr>
					<td><b>Nome</b></td>
					<td><b>Marca</b></td>
					<td><b>Ano</b></td>
					<td><b>Kilometragem</b></td>
					<td><b>Detalhes</b></td>
				</tr>
				<c:forEach items="${veiculos}" var="veiculo">
					<tr>
						<td>${veiculo.nome}</td>
						<td>${veiculo.marca}</td>
						<td>${veiculo.ano}</td>
						<td>${veiculo.kilometragem}</td>
						<td>
							<a class="btn btn-info btn-sm" role="button" href="detalhesAluga?chassi=${veiculo.chassi}">
	  							Mais
							</a>
						</td>
					</tr>
	
				</c:forEach>
			</table>	
		</div>
		
		<div class="caronas">
			<a class="btn btn-default" role="button" href="cadastroCarona">Cadastrar Nova Carona</a>
			<a style="float: right;" class="btn btn-danger" role="button" href="logout">Logout</a>
			<br/><br/>
			<table  class="table table-striped">
				<tr>
					<td><b>Vagas Disponíveis</b></td>
					<td><b>Origem</b></td>
					<td><b>Destino</b></td>
					<td><b>Data</b></td>
					<td id="vagas"><b>Vagas Totais</b></td>
					<td><b>Detalhes</b></td>
				</tr>
				<c:forEach items="${caronas}" var="carona">
					<tr>
						<td>${carona.qtd_vagas_disponiveis}</td>
						<td>${carona.partida}</td>
						<td>${carona.destino}</td>
						<td>${carona.data_saida}</td>
						<td>${carona.qtd_vagas}</td>
						<td>
							<a class="btn btn-info btn-sm" role="button" href="detalhesCarona?id=${carona.id}">
	  							Mais
							</a>
						</td>
					</tr>
					
				</c:forEach>
			</table>	
		</div>
		


	</div>
	<div style="position: absolute; bottom: 0; margin: 0; width: 100%" >
		<jsp:include page="rodape.jsp" />
	</div>
</body>
</html>