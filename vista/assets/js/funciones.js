// Funciones de busqueda y muestra:
function loginUser(){
	var datoslogin = $('#formLogin').serialize();
	$.ajax({
		url: '../control/login.control.php',
		type: 'POST',
		data: datoslogin,
	})
	.done(function(respuesta){
		$('#resultado').html(respuesta);
		console.log(respuesta);
		respuesta = parseInt(respuesta);
		switch(respuesta){
			case 1:
				window.location = "../vista/asignar.php";
			break;
			case 2:
				window.location = "../vista/configuracion.php";
			break;
			default:
				$('#resultado').html(respuesta);
			break;
		}
	})
}


// jquery me ayuda a simplificar la escritura de las funciones:
$(listaUser());

// Función para listar todos los usuarios:
function listaUser(parametro){
	// Ajax que es es el asicronico de javascript, va a capturar el dato y lo va a pasar al control:
	$.ajax({
		url: '../control/listauser.php',
		type: 'POST',
		data: { dato: parametro },
	})
	.done(function(tabla){
		// Con jquery puedo hacer paso de parametros usando el innerHTML:
		$('#resultados').html(tabla);
		console.log(tabla);
	})
}

// Condicionamos cuando buscar:
$(document).on('keyup', '#buscador', function(){
	var valorBuscar = $(this).val();
	// Condicionamos que sea diferente de vacio:
	if (valorBuscar !="") {
		// Llamamos a la función listaUser y le pasamos el dato capturado
		listaUser(valorBuscar);
	}else{
		listaUser();
	}
});


// Funciones de asignar horario:
function asignarHorario(){
	// Capturar datos de formulario:
	var datos = $('#asignarHorario').serialize();
	var dato = datos+'&asignar=true';
	// console.log(data);
	$.ajax({
		url: '../control/asignar.control.php',
		type: 'post',
		data : dato
	})
	.done(function(resultado){
		$('#ejecucion').html(resultado);
	})
}