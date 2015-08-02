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
		<form action="cadastrar" method="post" >
			
			<h2>Dados Pessoais</h2>
			<hr size="2px" color="gray" width="800px" align="left" />
			Nome: <input type="text" id="nome" name="nome"/><br /> 
			CPF: <input type="text" id="cpf" name="cpf" onKeyUp="javascript:numbersOnly(this);" /><br />
			Telefone:<input type="text" id="telefone" name="telefone"/><br />
			Celular:<input type="text" id="celular" name="celular"/><br />
			Email:<input type="text" id="email" name="email"/><br />
			RA<input type="text" id="ra" /><br />
			
			<h2>Dados de Moradia</h2>
			<hr size="2px" color="gray" width="800px" align="left" />
			Logradouro:<input type="text" id="logradouro" name="logradouro" /><br />
			Número:<input type="text" id="numero" name="numero" /><br />
			Complemento:<input type="text" id="complemento" name="complemento"/><br />			
			Cidade:<input type="text" id="cidade" name="cidade"/><br />
			Estado:<input type="text" id="estado" name="estado"/><br />
			
			<h2>Dados de Acesso</h2>
			<hr size="2px" color="gray" width="800px" align="left" />
			Usu&aacute;rio:<input type="text" id="login" name="login"/><br /> 
			Senha:<input type="password" id="senha" name="senha"/><br />
			<br /> 
			<input type="submit" value=" Cadastrar " onclick="return validaCampos()" id="envia"/> &emsp;
			<input type="reset" value=" Limpar " onclick="return validaCampos()" id="limpa"/>
			<input type="hidden" id="opcao" name="opcao" value="usuario" />
		</form><br/>
	</div>
	<jsp:include page="rodape.jsp" />
</body>
</html>