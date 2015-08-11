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
	height: 100%;
}
.veiculos {
	float: left;
	width: 50%;
	margin-left: 25%;
}

label{
	font-size: medium;
}

</style>

</head>
<body>
	<jsp:include page="cabecalho.jsp" />

	<div class=conteudo>
		
		<div class="veiculos">	
		<form action="insereAluguel" method="post" >
			<h2>Dados do Dono</h2>
			<hr size="2px" color="gray" width="100%" align="left" />
				  <div class="form-group">
				    <label for="nome">Nome:</label> <label for="nome">${pessoa.getNome()}</label>
				  </div>
				 <div class="form-group">
				    <label for="telefone">Telefone:</label> <label for="telefone">${pessoa.getTelefone()}</label>
				 </div>
				 <div class="form-group">
				    <label for="celular">Celular:</label> <label for="celular">${pessoa.getCelular()}</label>
				 </div>		
				 <div class="form-group">
				    <label for="email">E-mail:</label> <label for="email">${pessoa.getEmail()}</label>
				 </div> 
			
			<h2>Dados do Veiculo</h2>
			<hr size="2px" color="gray" width="100%" align="left" />
				 <div class="form-group">
				    <label for="Marca">Marca:</label> <label for="Marca">${veiculo.getMarca()}</label>
				 </div>
				 <div class="form-group">
				    <label for="Modelo">Modelo:</label> <label for="Modelo">${veiculo.getNome()}</label>
				 </div> 
				 <div class="form-group">
				    <label for="Ano:">Ano:</label> <label for="Ano:">${veiculo.getAno()}</label>
				 </div>
				 <div class="form-group">
				    <label for="KM">KM:</label> <label for="KM">${veiculo.getKilometragem()}</label>
				 </div>  
				 <div class="form-group">
				    <label for="obs">Observaç&otilde;es:</label> <label for="obs">${veiculo.getObservacao()}</label>
				 </div>  
				<br />
				
				<h2>Dados do Aluguel</h2>
				<hr size="2px" color="gray" width="100%" align="left" />
				  <div class="form-group">
				    <label for="data_inicio">Data Inicio:</label>
				    <input type="text" class="form-control" id="data_inicio" name="data_inicio" placeholder="mm/dd/aaaa hh:mm">
				  </div>
				  <div class="form-group">
				    <label for="data_devolucao">Data de Devolucao:</label>
				    <input type="text" class="form-control" id="data_devolucao" name="data_devolucao" placeholder="mm/dd/aaaa hh:mm">
				  </div>
				  <div class="form-group">
				    <label for="observacao">Observacao:</label>
				    <input type="text" class="form-control" id="observacao" name="observacao">
				  </div>
				  <div class="form-group">
				    <input type="hidden" class="form-control" id="idPessoa" name="idPessoa" value='${pessoa.getCpf()}' visible=false>
				  </div>	
				  <div class="form-group">
				    <input type="hidden" class="form-control" id="idVeiculo" name="idVeiculo" value='${veiculo.getChassi()}' visible=false>
				  </div>
				  <button type="submit" class="btn btn-primary btn-lg" id="envia">Entre em contato</button>
				<br/><br/><br/>
			</form>
		</div>
	<a class="btn btn-danger btn-sm" href="/UFABCRentACar/listaVeiculos">Voltar</a>
	</div>
	<div style="bottom: 0; margin: 0; margin-top: 10px; width: 100%" >
		<jsp:include page="rodape.jsp" />
	</div>
</body>
</html>