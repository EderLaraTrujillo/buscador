<?php
	include('conex.php');

	# Capturamos los datos del formulario:
	$user = $_POST['usuario'];
	$pass = $_POST['passuser'];

	# Lógica del control:
	$sql = "SELECT correo, usuario, tipoUsuario from login where correo = '".$user."' AND password = sha('".$pass."')";
	$exe = $con->query($sql);
	if ($exe->num_rows > 0) {
		# S el resultado es mayor a 0
		while($res = $exe->fetch_row()){
			session_start();
			$_SESSION['usuario']= $res[1];
			$_SESSION['perfil']= $res[2];
			$_SESSION['correo']= $res[0];
			
			switch ($_SESSION['perfil']) {
				case 'Instructor':
					echo "1";
					break;
				
				default:
					echo "2";
					break;
			}
		}

	}else{
		echo "Usuario y/o Contraseña incorrectos";
	}
?>