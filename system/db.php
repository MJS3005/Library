<?php
session_start();
// $db = new mysqli("localhost", "root","","library");

$db = mysqli_connect("localhost", "root","","library");

// if ($db == false) {
//     echo ("Ошибка" . mysqli_connect_error());
// }


mysqli_set_charset($db, "utf8"); // $db??