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
		<!-- Modal Carona-->
		<div class="modal fade" id="detalhesCarona" tabindex="-1" role="dialog" aria-labelledby="Detalhes de Carona">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="Detalhes">Detalhes da Carona</h4>
		      </div>
		      <div class="modal-body">
		      			<b>Carona oferecida por:</b> <label id="motoristaCarona"></label>
		      			<br/><br/>
		      			<b>Quantidade de Vagas:</b> <label id="vagasCarona"></label>
		      			<br/><br/>
		      			<b>Origem da Carona:</b> <label id="origemCarona"></label>
		      			<br/><br/>
		      			<b>Destino da Carona:</b> <label id="destinoCarona"></label>
		      			<br/><br/>
		      			<b>Hor�rio da Carona:</b> <label id="dataCarona"></label>
		      			<br/><br/>
		      			<b>Mapa:</b><br/>
		      			
		      			<!-- TODO:Add Google Maps -->
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
		        <button type="button" class="btn btn-primary">Aceitar Carona</button>
		      </div>
		    </div>
		  </div>
		</div>

		<!-- Modal Aluga-->
		<div class="modal fade" id="detalhesAluga" tabindex="-1" role="dialog" aria-labelledby="Detalhes do Veiculo">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="Detalhes">Detalhes do Veiculo</h4>
		      </div>
		      <div class="modal-body">
		      			<b>Veiculo oferecida por:</b> <label id="donoVeiculo"></label>
		      			<br/><br/>
		      			<b>Modelo do Veiculo:</b> <label id="modeloVeiculo"></label>
		      			<br/><br/>
		      			<b>Marca do Veiculo:</b> <label id="marcaVeiculo"></label>
		      			<br/><br/>
		      			<b>Kilometragem:</b> <label id="kmVeiculo"></label>
		      			<br/><br/>
		      			<b>Observa��es:</b> <label id="obsVeiculo"></label>
		      			<br/><br/>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
		        <button type="button" class="btn btn-primary">Alugar Veiculo</button>
		      </div>
		    </div>
		  </div>
		</div>



		<div class="veiculos">
			<a class="btn btn-default" role="button" href="cadastroVeiculo">Cadastrar Novo Ve�culo</a>
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
							<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#detalhesAluga" id="btnAluga">
	  							Mais
							</button>
						</td>
					</tr>
	
				</c:forEach>
			</table>	
		</div>
		
		<div class="caronas">
			<a class="btn btn-default" role="button" href="cadastroCarona">Cadastrar Nova Carona</a>
			<br/><br/>
			<table  class="table table-striped">
				<tr>
					<td id="vagas"><b>Vagas</b></td>
					<td><b>Origem</b></td>
					<td><b>Destino</b></td>
					<td><b>Data</b></td>
					<td><b>Detalhes</b></td>
				</tr>
				<c:forEach items="${caronas}" var="carona">
					<tr>
						<td>${carona.qtd_vagas}</td>
						<td>${carona.partida}</td>
						<td>${carona.destino}</td>
						<td>${carona.data_saida}</td>
						<td>
							<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#detalhesCarona">
	  							Mais
							</button>
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