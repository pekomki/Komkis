<?php
include "connect.php";

$table = $_POST['table'];
$code  = $_POST['code'];

if ($table == 'KRITHS')
    $sql = "DELETE FROM KRITHS WHERE code_k='$code'";

if ($table == 'DIAGWNIZOMENOS')
    $sql = "DELETE FROM DIAGWNIZOMENOS WHERE code_d='$code'";

if ($table == 'EKPOMPH')
    $sql = "DELETE FROM EKPOMPH WHERE code_e='$code'";

mysqli_query($conn, $sql);

header("Location: index.html");
exit;
