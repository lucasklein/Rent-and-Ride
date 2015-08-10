<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="bootstrap.jsp" />
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
</style>
<script type="text/javascript">
		function validaCampos() {
			var nome = document.getElementById('nome').value;
			var cpf = document.getElementById('cpf').value;
			var telefone = document.getElementById('telefone').value;
			var celular = document.getElementById('celular').value;
			var email = document.getElementById('email').value;
			var ra = document.getElementById('ra').value;
			var logradouro = document.getElementById('logradouro').value;
			var numero = document.getElementById('numero').value;
			var cidade = document.getElementById('cidade').value;
			var estado = document.getElementById('estado').value;
			var login = document.getElementById('login').value;
			var senha = document.getElementById('senha').value;
			
			//Verifica nome
			if (nome == "" || null) {
				alert("O campo Nome não pode ser vazio!");
				return false;
			} else if (nome.indexOf(" ") == -1) {
				alert("Por favor digite o nome completo!");
				return false;
			}
			
			//Verifica CPF
			if(!TestaCPF(cpf)){
				alert("CPF Inválido!");
			}
			
			//Verifica ao menos um telefone registrado
			if(telefone == "" || celular == ""){
				alert("Insira ao menos um telefone válido!");
			}
			
			//Verifica campo email
			if(email == "" || (email.indexOf("@") == -1)){
				alert("O campo Email não pode ser vazio e deve conter @!");
				return false;
			}
			
			//Verifica campo RA
			if(ra == "" || ra.length < 8){
				alert("O campo ra não pode ser vazio e deve conter 8 digitos!");
				return false;
			}
			
			//Verifica logradouro
			if (logradouro == "" || null) {
				alert("O campo Logradouro não pode ser vazio!");
				return false;
			}
			
			//Verifica numero
			if (numero == "" || isNaN(numero)) {
				alert("O campo número não pode ser vazio e deve conter apenas números!");
				return false;
			}
				
			//Verifica cidade
			if (cidade == "" || null) {
				alert("O campo Cidade não pode ser vazio!");
				return false;
			}
			
			//Verifica estado
			if (estado == "" || null) {
				alert("O campo Estado não pode ser vazio!");
				return false;
			}
			
			//Verifica campo Login
			if (login == "" || null) {
				alert("O campo Usuário não pode ser vazio!");
				return false;
			} 
			
			//Verifica campo password
			if(email == "" || null){
				alert("O campo Senha não pode ser vazio!");
				return false;
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
		<form action="inserePessoa" method="post" >
			
			<h2>Dados Pessoais</h2>
			<hr size="2px" color="gray" width="800px" align="left" />
			
				  <div class="form-group">
				    <label for="nome">Nome:</label>
				    <input type="text" class="form-control" id="nome" name="nome">
				  </div>
				  <div class="form-group">
				    <label for="cpf">CPF:</label>
				    <input type="text" class="form-control" id="cpf" name="cpf" onKeyUp="javascript:numbersOnly(this);">
				  </div>
				  <div class="form-group">
				    <label for="telefone">Telefone:</label>
				    <input type="text" class="form-control" id="telefone" name="telefone">
				  </div>
				  <div class="form-group">
				    <label for="celular">Celular:</label>
				    <input type="text" class="form-control" id="celular" name="celular">
				  </div>
				  <div class="form-group">
				    <label for="email">Email:</label>
				    <input type="text" class="form-control" id="email" name="email">
				  </div>
				  <div class="form-group">
				    <label for="ra">RA:</label>
				    <input type="text" class="form-control" id="ra" name="ra">
				  </div>
			
			<h2>Dados de Moradia</h2>
			<hr size="2px" color="gray" width="800px" align="left" />
			
				  <div class="form-group">
				    <label for="logradouro">Logradouro:</label>
				    <input type="text" class="form-control" id="logradouro" name="logradouro">
				  </div>
				  <div class="form-group">
				    <label for="logradouro">Número:</label>
				    <input type="text" class="form-control" id="numero" name="numero">
				  </div>
				  <div class="form-group">
				    <label for="logradouro">Complemento:</label>
				    <input type="text" class="form-control" id="complemento" name="complemento">
				  </div>
				  <div class="form-group">
				    <label for="logradouro">Cidade:</label>
				    <input type="text" class="form-control" id="cidade" name="cidade">
				  </div>
				  <div class="form-group">
				    <label for="logradouro">Estado:</label>
				    <input type="text" class="form-control" id="estado" name="estado">
				  </div>
			
			<h2>Dados de Acesso</h2>
			<hr size="2px" color="gray" width="800px" align="left" />
				  <div class="form-group">
				    <label for="senha">Senha:</label>
				    <input type="password" class="form-control" id="senha" name="senha">
				  </div>

			<br /> 
			
			<button type="submit" class="btn btn-primary" onclick="return validaCampos()" id="envia">Cadastrar</button>
			<button type="reset" class="btn btn-danger" onclick="return validaCampos()" id="limpa">Limpar</button>			
			
			<input type="hidden" id="opcao" name="opcao" value="usuario" />
		</form><br/>
		<a href="/UFABCRentACar/listaVeiculos">Voltar</a>
	</div>
	<jsp:include page="rodape.jsp" />
</body>
</html>