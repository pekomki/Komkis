<?php
$host = "localhost";
$user = "student_2520";
$pass = "pass2520";
$db   = "student_2520";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Σφάλμα σύνδεσης στη βάση δεδομένων: " . mysqli_connect_error());
}
?>
