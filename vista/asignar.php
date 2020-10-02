<?php  
	include('menu.inc');
?>
<section class="container">
	<div class="row">

		<div class="col-md-12 row">
			<h3 class="text-center col-md-12">Asignar Horarios:</h3>
			<div class="col">
				<h4 class="text-center text-left">Lunes</h4>
				<button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="1">Asignar Instructor</button>
			</div>
			<div class="col">
				<h4 class="text-center text-left">Martes</h4>
				<button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="2">Asignar Instructor</button>
			</div>
			<div class="col">
				<h4 class="text-center text-left">Miércoles</h4>
				<button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="3">Asignar Instructor</button>
			</div>
			<div class="col">
				<h4 class="text-center text-left">Jueves</h4>
				<button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="4">Asignar Instructor</button>
			</div>
			<div class="col">
				<h4 class="text-center text-left">Viernes</h4>
				<button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="5">Asignar Instructor</button>
			</div>
			<div class="col">
				<h4 class="text-center text-left">Sábado</h4>
				<button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="6">Asignar Instructor</button>
			</div>
			<div class="col">
				<h4 class="text-center text-left">Domingo</h4>
				<button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="7">Asignar Instructor</button>
			</div>
		</div>

		<!-- Seccion de vista de horario -->
		<div class="row">
			<nav class="col-md-12 mt-5">
			  <div class="nav nav-tabs" id="nav-tab" role="tablist">
			    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#lunes" role="tab" aria-controls="nav-home" aria-selected="true">Lunes</a>
			    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#martes" role="tab" aria-controls="nav-profile" aria-selected="false">Martes</a>
			    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#miercoles" role="tab" aria-controls="nav-contact" aria-selected="false">Miércoles</a>
		    	<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#jueves" role="tab" aria-controls="nav-contact" aria-selected="false">Jueves</a>
		      	<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#viernes" role="tab" aria-controls="nav-contact" aria-selected="false">Viernes</a>
		       	<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#sabado" role="tab" aria-controls="nav-contact" aria-selected="false">Sábado</a>
		        <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#domingo" role="tab" aria-controls="nav-contact" aria-selected="false">Domingo</a>
			  </div>
			</nav>
			<div class="tab-content col-md-12	" id="nav-tabContent">
			  <div class="tab-pane fade show active" id="lunes" role="tabpanel" aria-labelledby="nav-home-tab">lunes</div>
			  <div class="tab-pane fade" id="martes" role="tabpanel" aria-labelledby="nav-profile-tab">martes</div>
			  <div class="tab-pane fade" id="miercoles" role="tabpanel" aria-labelledby="nav-contact-tab">miercoles</div>
			  <div class="tab-pane fade" id="jueves" role="tabpanel" aria-labelledby="nav-contact-tab">jueves</div>
			  <div class="tab-pane fade" id="viernes" role="tabpanel" aria-labelledby="nav-contact-tab">viernes</div>
			  <div class="tab-pane fade" id="sabado" role="tabpanel" aria-labelledby="nav-contact-tab">sabado</div>
			  <div class="tab-pane fade" id="domingo" role="tabpanel" aria-labelledby="nav-contact-tab">domingo</div>
			</div>

		</div>
		
	</div>
</section>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="modal-titulo"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <form class="row" id="asignarHorario" method="POST">
          <div class="form-group col-sm-12">
            <input type="hidden" class="form-control dia" name="idDia" id="recipient-name">
          </div>
          <div class="form-group col-sm-3">
          	<label for="message-text" class="col-form-label">Periodo:</label>
            <?php echo'<input type="text" name="periodo" class="form-control" readonly value="'.date("Y").'">' ?>
          </div>
          <div class="form-group col-sm-3">
          	<label for="message-text" class="col-form-label">Trimestre:</label>
            <input type="text" class="form-control" name="trimperiodo">
          </div>
          <div class="form-group col-md-6">
            <label for="message-text" class="col-form-label">Instructor:</label>
            <select name="idUsuario" class="form-control">
            	<option value="">Seleccione un Instructor:</option>
            	<?php  
            		include('../control/conex.php');
            		$sql = "SELECT * from instructores";
            		$exe = $con->query($sql);
            		$con->error;
            		while($res = $exe->fetch_row()){
            			echo '<option value="'.$res[0].'">'.$res[1].'</option>';
            		}
            	?>
            </select>
          </div>
          <div class="form-group col-sm-6">
          	<label for="ambiente" class="col-form-label">Ambiente de Aprendizaje:</label>
            <select name="idAmbiente" class="form-control">
            	<option value="">Seleccione un ambiente</option>
            	<?php  
            		include('../control/conex.php');
            		$sql = "SELECT * from ambiente";
            		$exe = $con->query($sql);
            		$con->error;
            		while($res = $exe->fetch_row()){
            			echo '<option value="'.$res[0].'">'.$res[2].'</option>';
            		}
            	?>
            </select>
          </div>
          
          <div class="form-group col-sm-6">
          	<label for="ambiente" class="col-form-label">Ficha:</label>
            <select name="idFicha" class="form-control">
            	<option value="">Seleccione una Ficha</option>
            	<?php  
            		include('../control/conex.php');
            		$sql = "SELECT * from ficha;";
            		$exe = $con->query($sql);
            		$con->error;
            		while($res = $exe->fetch_row()){
            			echo '<option value="'.$res[0].'">'.$res[5].'</option>';
            		}
            	?>
            </select>
          </div>

          <div class="form-group col-sm-4">
          	<label for="ambiente" class="col-form-label">AP:</label>
            <select name="idActiProy" class="form-control">
            	<option value="">Seleccione una Actividad de Aprendizaje</option>
            	<?php  
            		include('../control/conex.php');
            		$sql = "SELECT * from actiproy";
            		$exe = $con->query($sql);
            		$con->error;
            		while($res = $exe->fetch_row()){
            			echo '<option value="'.$res[0].'">'.$res[1].'</option>';
            		}
            	?>
            </select>
          </div>
		  <div class="form-group col-sm-4">
			<label for="ambiente" class="col-form-label">Incio:</label>
			<input type="time" name="horaInicio" class="form-control">
		  </div>
		  <div class="form-group col-sm-4">
		  	<label for="ambiente" class="col-form-label">Fin:</label>
		  	<input type="time" name="horaFin" class="form-control">
		  </div>
        </form>
        <section class="text-capitalize col-md-12" id="ejecucion">
        	<!-- Resultados de la operación -->
        </section>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" onclick="asignarHorario()" class="btn btn-primary">Asignar Horario</button>
      </div>
    </div>
  </div>
</div>

<script>
	$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes

	  recipiente = parseInt(recipient);
	  console.log(recipiente);
	  switch (recipiente) {
	  case 1:
	    var titulo = "Lunes";
	    break;
	  case 2:
	    var titulo = "Martes";
	    break;
	  case 3:
	    var titulo = "Miércoles";
	    break;
	   case 4:
	    var titulo = "Jueves";
	    break;
	   case 5:
	    var titulo = "Viernes";
	    break;
	   case 6:
	    var titulo = "Sábado";
	    break;
	  default:
	    var titulo = "Domingo";
	    break;
	}
	  
	  var modal = $(this)
	  modal.find('.modal-title').text('Asignar Horario a Instructor el Día ' + titulo)
	  modal.find('.dia').val(recipient)
	})
</script>