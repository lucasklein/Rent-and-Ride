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
.caronas {
	float: left;
	width: 30%;
	padding: 5px 5px 5px 5px;
	margin-left: 5%;
}

label{
	font-size: medium;
}
.mapcontainer{
	float: left;
	width: 65%;
	padding: 5px 5px 5px 5px;
}
#map-canvas { 
	height: 400px;
	width: 800px; 
	float: left;
	margin: 0; 
	padding: 0;
}
</style>
<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCseDuHcGGK27OmoHIAQUXxjMO2YNb_oR0">
</script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
	var geocoder = new google.maps.Geocoder();
	var latDest, longDest, latOri, longOri;
	var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer();
	
	geocoder.geocode( 
		{ 'address': "${carona.getPartida()}"}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			latOri = results[0].geometry.location.lat();
			longOri = results[0].geometry.location.lng();
		} 
	}); 
	
	geocoder.geocode( 
			{ 'address': "${carona.getDestino()}"}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				latDest = results[0].geometry.location.lat();
				longDest = results[0].geometry.location.lng();
			} 
		}); 
	
      function initialize() {
    	  var myLatlngOri = new google.maps.LatLng(latOri, longOri);
    	  var myLatlngDest = new google.maps.LatLng(latDest, longDest);
        var mapOptions = {
          center: myLatlngOri,
          zoom: 13
        };
        var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
        
        var markerDest = new google.maps.Marker({
            position: myLatlngDest,
            map: map,
            label: 'Ponto de Destino',
        });
        
        var markerOri = new google.maps.Marker({
            position: myLatlngOri,
            map: map,
            label: 'Ponto de Partida'
        });
        
        var request = {
        	       origin: myLatlngOri, 
        	       destination: myLatlngDest,
        	       travelMode: google.maps.DirectionsTravelMode.DRIVING
       	};

     	   directionsService.route(request, function(response, status) {
     	      if (status == google.maps.DirectionsStatus.OK) {
     	    	 directionsDisplay.setMap(map);
     	         directionsDisplay.setDirections(response);
     	      }
     	   });
      }
      google.maps.event.addDomListener(window, 'load', initialize);
</script>


</head>
<body>
	<jsp:include page="cabecalho.jsp" />

	<div class=conteudo>
		
		<div class="caronas">	
		<form action="#" method="post" >
			<h2>Dados do Condutor</h2>
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
			
			<h2>Dados da Carona</h2>
			<hr size="2px" color="gray" width="100%" align="left" />
				 <div class="form-group">
				    <label for="vagas">Vagas no veiculo:</label> <label for="vagas">${carona.getQtd_vagas()}</label>
				 </div>
				 <div class="form-group">
				    <label for="origem">Origem:</label> <label for="origem">${carona.getPartida()}</label>
				 </div> 
				 <div class="form-group">
				    <label for="destino">Destino:</label> <label for="destino">${carona.getDestino()}</label>
				 </div> 
				 <div class="form-group">
				    <label for="vagas">Data:</label> <label for="vagas">${carona.getData_saida()}</label>
				 </div>  
				<br />

				<button type="submit" class="btn btn-success btn-lg" id="envia">Quero essa carona!</button>
				<a href="listaVeiculos" class="btn btn-danger btn-lg">Voltar</a>
				<br/><br/><br/>
		</div>
		<div class="mapcontainer">
			<h2>Mapa:</h2>
			<hr size="2px" color="gray" width="800px" align="left" />
			<div id="map-canvas"></div>
		</div>
	</div>
	
	<div style="bottom: 0; margin: 0; width: 100%" >
		<jsp:include page="rodape.jsp" />
	</div>
</body>
</html>