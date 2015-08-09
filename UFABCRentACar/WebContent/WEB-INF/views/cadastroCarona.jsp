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
		function validaCampos() {
			var partida = document.getElementById('partida').value;
			var destino = document.getElementById('destino').value;
			var qtd_vagas = document.getElementById('qtd_vagas').value;
			var data_saida = document.getElementById('data_saida').value;
			//Verifica origem
			if (partida == "" || null) {
				alert("O campo partida não pode ser vazio!");
				return false;
			} 
			
			//Verifica destino
			if (destino == "" || null) {
				alert("O campo destino não pode ser vazio!");
				return false;
			}
			
			//Verifica vagas
			if (qtd_vagas == "" || isNaN(qtd_vagas)) {
				alert("O campo qtd de vagas não pode ser vazio e deve conter apenas números!");
				return false;
			}
			
			//Verifica data
			if (data_saida == "" || null) {
				alert("O campo data de saida não pode ser vazio!");
				return false;
			}
	
		}
		
		function numbersOnly(campo){  
			var digits="0123456789"  
			var campo_temp   
			    for (var i=0;i<campo.value.length;i++){  
			        campo_temp=campo.value.substring(i,i+1)   
			        if (digits.indexOf(campo_temp)==-1){  
			            campo.value = campo.value.substring(0,i);  
			        }  
				}  
		}  
		
	</script>

</head>
<body>
	
	<jsp:include page="cabecalho.jsp" />

	<div class="registerForm">
		<form action="insereCarona" method="post" >
			
			<h2>Dados da Carona</h2>
			<hr size="2px" color="gray" width="800px" align="center" />
				  <div class="form-group">
				    <label for="ano">Quantidade de Vagas:</label>
				    <input type="text" class="form-control" id="qtd_vagas" name="qtd_vagas" onKeyUp="javascript:numbersOnly(this);">
				  </div>
				  <div class="form-group">
				    <label for="nome">Endereço de Origem:</label>
				    <input type="text" class="form-control" id="partida" name="partida">
				  </div>
				  <div class="form-group">
				    <label for="marca">Endereço de Destino:</label>
				    <input type="text" class="form-control" id="destino" name="destino">
				  </div>
				  <div class="form-group">
				    <label for="data_saida">Data de Sa&iacute;da:</label>
					<input type='text' class="form-control" id='data_saida' name="data_saida"/>
					</div>
				  <div class="form-group">
				    <label for="cpf">CPF Motorista:</label>
				    <input type="text" class="form-control" id="cpf" name="cpf" readonly="readonly" value="${pessoa.getCpf()}">
				  </div>

			<button type="submit" class="btn btn-primary" onclick="return validaCampos()" id="envia">Cadastrar</button>
			<button type="reset" class="btn btn-danger" onclick="return validaCampos()" id="limpa">Limpar</button>			
			
			<br/><br/>
			<a href="/">Voltar</a>
		</form><br/>
	</div>
	<jsp:include page="rodape.jsp" />
</body>
</html>