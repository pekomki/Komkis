<?php
$table = $_GET['table'] ?? '';
$allowed = ['EKPOMPH','KRITHS','DIAGWNIZOMENOS'];
if (!in_array($table,$allowed)) die("Λάθος πίνακας");
?>

<!DOCTYPE html>
<html lang="el">
<head>
<meta charset="UTF-8">
<title>Delete <?php echo $table; ?></title>
<link rel="stylesheet" href="style.css">
</head>

<body>
<div class="container">
<div class="card">

<h1>Delete <?php echo $table; ?></h1>



<form method="post" action="delete_exe.php" class="form">
<input type="hidden" name="table" value="<?php echo $table; ?>">
<input name="code" placeholder="Κωδικός προς διαγραφή" required>
<button type="submit" class="back-btn">Διαγραφή</button>
</form>

<a href="index.html" class="back-btn">⬅ Πίσω στο μενού</a>

</div>
</div>
</body>
</html>
