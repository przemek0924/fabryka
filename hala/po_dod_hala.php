<?php
$nazwa = $_POST['nazwa'];
$adres = $_POST['adres'];
$con = mysqli_connect('localhost', 'root', '', 'fabryka');
mysqli_select_db($con,'fabryka');
$zap1 = mysqli_query ($con,"select nazwa, adres from hala");

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
	height: 500px;
	float: left;
}

#panel_prawy
{
	padding: 30px;
	background-color: #a2cd5a;
	width: 80%;
	height: 500px;
	float: left;
}
</style>
<body>
<div id="baner">
</div>
<div id="panel_lewy">
<a href="../menu.html">Powrót do Menu</a><br>
<a href="dod_hala_form.php">Dodanie hali</a><br>
</div>
<div id="panel_prawy">
<body>
		<?php
$zap2=mysqli_query($con,"INSERT INTO hala (nazwa, adres) VALUES ('".$nazwa."','".$adres."')");
	if ($zap2)
			echo 'Hala została dodana poprawnie';
	else
			echo "Error";
?>
<br>
</div>
	</body>
</html>