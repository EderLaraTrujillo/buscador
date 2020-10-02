<?php 	 
include('menu.inc');
?>

<section class="container">
	<div class="row">
		<!-- Primera Fila  -->
		<div class="col-md-3"></div>
		<div class="col-md-6 mt-4">
			<div class="input-group input-group-lg">
				<div class="input-group-prepend">
					<span class="input-group-text bg-primary text-light" id="inputGroup-sizing-lg">Buscar</span>
				</div>
				<input type="text" id="buscador" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			</div>
		</div>
		<div class="col-md-3"></div>

		<!-- Resultados -->
		<article class="col-md-12">
			<!-- Mostramos todos los usuarios -->
			<div class="table-responsive">
				<table class="table">
					<thead class="bg-dark text-light">
						<tr>
						<th>Número</th>
						<th>Nombre</th>
						<th>Id Clave</th>
						<th>Estado</th>
						</tr>
					</thead>
					<tbody id="resultados">
						<!-- Mostramos todos los resultados -->
					</tbody>
				</table>
			</div>
		</article>
	</div>
</section>

<script src="assets/js/funciones.js"></script>