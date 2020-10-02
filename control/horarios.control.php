<?php  
	include "conex.php";

	$sql = "SELECT * FROM  horarios";
	$exe = $con->query($sql);

	if ($exe->num_rows > 0){
		while ($res = $exe->fetch_row()){
			echo '<tr>';
			switch ($res[2]) {
				case 'Lunes':
					echo '	<td>
								<p>'.$res[4].'</p>
								<p><b>'.$res[0].'</b></p>
								<p>'.$res[6].'-'.$res[7].'</p>
								<p>'.$res[1].'</p>
								<p>'.$res[3].'</p>
							</td>';
					break;
				case 'Martes':
					echo '
							<td>
								<p>'.$res[4].'</p>
								<p><b>'.$res[0].'</b></p>
								<p>'.$res[6].'-'.$res[7].'</p>
								<p>'.$res[1].'</p>
								<p>'.$res[3].'</p>
							</td>';
					break;
				case 'Miercoles':
					echo '
							<td>
								<p>'.$res[4].'</p>
								<p><b>'.$res[0].'</b></p>
								<p>'.$res[6].'-'.$res[7].'</p>
								<p>'.$res[1].'</p>
								<p>'.$res[3].'</p>
							</td>';
					break;
				default:
					# code...
					break;
			}
			echo '</tr>';
		}
	}else{
		echo "No se han realizado asignaciones de horarios.";
	}
?>