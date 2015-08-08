<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="bootstrap.jsp" />
<meta charset="ISO-8859-1">
<title>UFABC Rent a Car & Take a Ride - Login</title>
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

#loginForm {
	float: left;
	margin-top: 80px;
	margin-left: 45%;
}
</style>
</head>

<body>
	<script type="text/javascript">
		function validaCampos() {
			var login = document.getElementById('login').value;
			var senha = document.getElementById('senha').value;

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
	</script>

	<jsp:include page="cabecalho.jsp" />

	<div id="loginForm"> 	
	
		<form action="firstPage.jsp" method="post">
				  
				  <div class="form-group">
				    <label for="login">Usuário:</label>
				    <input type="text" class="form-control" id="login">
				  </div>
				  <div class="form-group">
				    <label for="senha">Senha:</label>
				    <input type="password" class="form-control" id="senha">
				  </div>
					
				  <button type="submit" class="btn btn-primary" onclick="return validaCampos()">Entrar</button>
			

			<!--<input type="submit" value=" Entrar " onclick="return validaCampos()" /> &emsp; --> <a href="novoCadastro">Cadastre-se Aqui!</a>  <br/>
			
		</form>
		
	</div>
	<div style="position: absolute; bottom: 0; margin: 0; width: 100%" >
		<jsp:include page="rodape.jsp" />
	</div>
</body>
</html>