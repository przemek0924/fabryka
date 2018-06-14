<?php

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
	padding-left: 30px;
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
</div>
<div id="panel_prawy">

<form method="post" action="po_usuw_hala.php">
<table>
<tr>
<td></td><td><b>Nazwa hali do usunięcia</b><br></td>		
</tr>
<tr>
				<td>Nazwa:</td><td><input type="text" name="nazwa"></td><br>
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
echo "<tr> <td>Nazwa</td><td>Adres</td></tr>" ;
while ($dane1 = mysqli_fetch_assoc($zap1)) {
	echo "<tr> <td>" . $dane1['nazwa'] . " </td><td>" . $dane1['adres'] . "</td></tr>";
} 
echo "<table>";
mysqli_close($con);
?>
</div>
	</body>
</html>
