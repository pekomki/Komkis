<?php
include "connect.php";

$table = $_GET['table'] ?? '';

$allowed = ['EKPOMPH', 'KRITHS', 'DIAGWNIZOMENOS'];
if (!in_array($table, $allowed)) {
    die("Μη έγκυρος πίνακας");
}

$result = mysqli_query($conn, "SELECT * FROM $table");
?>

<!DOCTYPE html>
<html lang="el">
<head>
<meta charset="UTF-8">
<title>Εμφάνιση <?php echo $table; ?></title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container">
  <div class="card">

    <h1><?php echo $table; ?></h1>

    <table class="data-table">
      <tr>
        <?php
        while ($field = mysqli_fetch_field($result)) {
            echo "<th>{$field->name}</th>";
        }
        ?>
      </tr>

      <?php
      while ($row = mysqli_fetch_assoc($result)) {
          echo "<tr>";
          foreach ($row as $val) {
              echo "<td>$val</td>";
          }
          echo "</tr>";
      }
      ?>
    </table>

    <a href="index.html" class="back-btn">⬅ Πίσω στο μενού</a>

  </div>
</div>

</body>
</html>
