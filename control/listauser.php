<?php 	 
	include('conex.php');
	# Mostramos todos los usuarios:
	$sql = "SELECT * FROM usuario";

	# Primero es condicionar el valor que se pase a buscar:
	if (isset($_POST['dato'])) {
		# Si el dato pasa a activo:
		$dato = $con->real_escape_string($_POST['dato']);
		$sql = "SELECT * FROM usuario WHERE correo LIKE '%".$dato."%'";
		# $sql = "CALL CrudTable('','','','','guardar')";
	}
	# Ejecuto la consulta SQL:
	$exe = $con->query($sql);
	# Validamos que traiga mas de 1 elemento:
	if ($exe->num_rows>0) {
		# Si al ejecutar obtengo al menos un resultado, lo muestro:
		while($res = $exe->fetch_row()){
			echo '<tr>
					<td>'.$res[0].'</td>
				  	<td>'.$res[1].'</td>
				  	<td>'.$res[2].'</td>
				  	<td>Activo</td>
				  </tr>';
		}
	}else {

			echo $sql;
			echo " No se encontraron datos con los criterios de búsqueda ";
	}

?>
