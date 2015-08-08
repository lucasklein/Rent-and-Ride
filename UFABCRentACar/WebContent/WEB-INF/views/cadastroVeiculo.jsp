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
			if (chassi == "" || isNaN(chassi)) {
				alert("O campo Chassi não pode ser vazio e deve conter apenas números!");
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
			Nome: <input type="text" id="nome" name="nome"/><br /> 
			Marca: <input type="text" id="marca" name="marca"  /><br />
			Ano:<input type="text" id="ano" name="ano" onKeyUp="javascript:numbersOnly(this);"/><br />
			Kilometragem:<input type="text" id="kilometragem" name="kilometragem" onKeyUp="javascript:numbersOnly(this);"/><br />
			Chassi:<input type="text" id="chassi" name="chassi"/><br />
			CPF Dono<input type="text" id="cpf" name="cpf" /><br />
			Observação:<input type="text" id="observacao" name="observacao" /><br />
			
			
			<input type="submit" value=" Cadastrar " onclick="return validaCampos()" id="envia"/> &emsp;
			<input type="reset" value=" Limpar " onclick="return validaCampos()" id="limpa"/>
			<input type="hidden" id="opcao" name="opcao" value="usuario" />
			<a href="/UFABCRentACar/">Voltar</a>
		</form><br/>
	</div>
	<jsp:include page="rodape.jsp" />
</body>
</html>