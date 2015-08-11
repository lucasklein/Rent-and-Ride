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
			var nome = document.getElementById('nome').value;
			var marca = document.getElementById('marca').value;
			var ano = document.getElementById('ano').value;
			var kilometragem = document.getElementById('kilometragem').value;
			var chassi = document.getElementById('chassi').value;
			var cpf = document.getElementById('cpf').value;
			
			//Verifica nome
			if (nome == "" || null) {
				alert("O campo Nome não pode ser vazio!");
				return false;
			} 
			
			//Verifica marca
			if (marca == "" || null) {
				alert("O campo Marca não pode ser vazio!");
				return false;
			}
			
			//Verifica ano
			if (ano == "" || isNaN(ano)) {
				alert("O campo Ano não pode ser vazio e deve conter apenas números!");
				return false;
			}
			
			//Verifica km
			if (kilometragem == "" || isNaN(kilometragem)) {
				alert("O campo Kilometragem não pode ser vazio e deve conter apenas números!");
				return false;
			}
			
			//Verifica chassi
			if (chassi == "")) {
				alert("O campo Chassi não pode ser vazio!");
				return false;
			}
			
			//Verifica CPF
			if(!TestaCPF(cpf)){
				alert("CPF Inválido!");
			}
	
		}
		
		function TestaCPF(strCPF) { 
			var Soma; 
			var Resto; 
			
			Soma = 0; 
			
			if (strCPF == "00000000000") return false; 
			
			for (i=1; i<=9; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i); 
			Resto = (Soma * 10) % 11; 
			
			if ((Resto == 10) || (Resto == 11)) Resto = 0; 
			if (Resto != parseInt(strCPF.substring(9, 10)) ) return false; 
			
			Soma = 0; 
			for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i); 
			Resto = (Soma * 10) % 11; 
			
			if ((Resto == 10) || (Resto == 11)) Resto = 0; 
			if (Resto != parseInt(strCPF.substring(10, 11) ) ) return false; 
		    
			return true; 
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
		<form action="insereVeiculo" method="post" >
			
			<h2>Dados Veiculo</h2>
			<hr size="2px" color="gray" width="800px" align="center" />
			
				  <div class="form-group">
				    <label for="nome">Nome:</label>
				    <input type="text" class="form-control" id="nome" name="nome">
				  </div>
				  <div class="form-group">
				    <label for="marca">Marca:</label>
				    <input type="text" class="form-control" id="marca" name="marca">
				  </div>
				  <div class="form-group">
				    <label for="ano">Ano:</label>
				    <input type="text" class="form-control" id="ano" name="ano" onKeyUp="javascript:numbersOnly(this);">
				  </div>
				  <div class="form-group">
				    <label for="kilometragem">Kilometragem:</label>
				    <input type="text" class="form-control" id="kilometragem" name="kilometragem" onKeyUp="javascript:numbersOnly(this);">
				  </div>
				  <div class="form-group">
				    <label for="chassi">Chassi:</label>
				    <input type="text" class="form-control" id="chassi" name="chassi">
				  </div>
				  <div class="form-group">
				    <label for="cpf">CPF Dono:</label>
				    <input type="text" class="form-control" id="cpf" name="cpf" readonly="readonly" value="${pessoa.getCpf()}">
				  </div>
				  <div class="form-group">
				    <label for="observacao">Observação:</label>
				    <input type="text" class="form-control" id="observacao" name="observacao">
				  </div>
		
			<button type="submit" class="btn btn-primary" onclick="return validaCampos()" id="envia">Cadastrar</button>
			<button type="reset" class="btn btn-danger" onclick="return validaCampos()" id="limpa">Limpar</button>			
			
			<br/><br/>
			
		</form><br/>
		<a class="btn btn-danger btn-sm" href="/UFABCRentACar/listaVeiculos">Voltar</a>
	</div>
	<jsp:include page="rodape.jsp" />
</body>
</html>