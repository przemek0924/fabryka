<?php

include("../db.php");
$zap1 = mysqli_query ($con,"select id_op, nazwisko, imie, placa, data_zatrudnienia from operator");

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

	padding-left: 30px;
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
</div>
<div id="panel_prawy">

<form method="post" action="po_usuw_oper.php">
<table>
<tr>
<td></td><td><b>Operator do usunięcia</b><br></td>		
</tr>
<tr>
				<td>ID operatora:</td><td><input type="text" name="id_op"></td><br>
</tr>

<td></td>				
<td>			<input type="reset" value="CZYŚĆ">
				<input type="submit" value="USUŃ">
</td>
</table>
			</form>
		<p>
<?php
echo "<table border='1'>";
echo "<tr> <td>ID operatora</td><td>Nazwisko</td><td>Imię</td><td>Płaca</td><td>Data zatrudnienia</td></tr>" ;
while ($dane1 = mysqli_fetch_assoc($zap1)) {
	echo "<tr> <td>" . $dane1['id_op'] . " </td><td>" . $dane1['nazwisko'] . "</td><td>". $dane1['imie'] . "</td><td>". $dane1['placa'] . "</td><td>". $dane1['data_zatrudnienia']. "</td></tr>";
} 
echo "<table>";
mysqli_close($con);
?>
</div>
	</body>
</html>
