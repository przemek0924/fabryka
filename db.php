<?php
$con = mysqli_connect('localhost', 'root', '', 'fabryka');

if (!$con) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

?>