<?php
include "connect.php";

$table = $_POST['table'];

if ($table == 'KRITHS') {
    $sql = "INSERT INTO KRITHS VALUES
    ('$_POST[code]','$_POST[name]','$_POST[exp]','$_POST[eid]')";
}

if ($table == 'DIAGWNIZOMENOS') {
    $sql = "INSERT INTO DIAGWNIZOMENOS VALUES
    ('$_POST[code]','$_POST[name]','$_POST[age]','$_POST[talent]')";
}

if ($table == 'EKPOMPH') {
    $sql = "INSERT INTO EKPOMPH VALUES
    ('$_POST[code]','$_POST[name]','$_POST[date]','$_POST[loc]')";
}

mysqli_query($conn, $sql);

header("Location: index.html");
exit;
