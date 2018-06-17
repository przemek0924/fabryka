<?php
$nr_ew = $_POST['id_maszyny'];
$id_op = $_POST['id_pracownika'];
include("../db.php");

 ?>
<!Doctype html>
<html>
<meta charset="utf-8">
<link rel="stylesheet" href="../css/bootstrap.min.css"  type="text/css">
<style>
#baner
{
	background-image: url("../css/baner.jpg");
	text-align: right;
	height: 100px;
}

#panel_lewy
{
	background-color: #98fb98;
	padding: 30px;
	width: 20%;
	height: 100vh;
	float: left;
}

#panel_prawy
{
	padding: 30px;
	background-color: #a2cd5a;
	width: 80%;
	height: 100vh;
	float: left;
}
</style>
<body>
<div id="baner">
</div>
<div id="panel_lewy">
<a href="../index.html">Powrót do Menu</a><br>
<a href="usuw_ewid_form.php">Usuniecie ewidencji</a><br>
</div>
<div id="panel_prawy">
<body>
		<?php
$zap2=mysqli_query($con,"Delete from ewidencja where id_maszyny='$nr_ew' and id_pracownika='$id_op'");

	if ($zap2)
			echo 'ewidencja została usunięta poprawnie';
	else
			echo 'Error';
mysqli_close($con);
?>
<br>
</div>
	</body>
</html>
