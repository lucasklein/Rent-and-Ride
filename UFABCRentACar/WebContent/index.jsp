<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UFABC Rent a Car & Take a Ride - Login</title>
<link href="${pageContext.request.contextPath}/CSS/style.css" rel="stylesheet" type="text/css" > 
</head>

<body>
	<script type="text/javascript">
		function validaCampos() {
			var login = document.getElementById('login').value;
			var senha = document.getElementById('senha').value;

			//Verifica campo Login
			if (login == "" || null) {
				alert("O campo Usu�rio n�o pode ser vazio!");
				return false;
			} 
			
			//Verifica campo password
			if(email == "" || null){
				alert("O campo Senha n�o pode ser vazio!");
				return false;
			}
		}
	</script>

	<jsp:include page="cabecalho.jsp" />

	<div id="loginForm"> 	
		<form action="firstPage.jsp" method="post">
			Usu&aacute;rio:<br/><input type="text" id="login" /><br/>
			Senha:<br/><input type="password" id="senha" /><br/><br/>
			<input type="submit" value=" Entrar " onclick="return validaCampos()" /> &emsp; <a href="cadastro.jsp">Cadastre-se Aqui!</a>  <br/>
			
		</form>
	</div>
	<div style="position: absolute; bottom: 0; margin: 0; width: 100%" >
		<jsp:include page="rodape.jsp" />
	</div>
</body>
</html>