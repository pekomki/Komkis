<?php
$table = $_GET['table'] ?? '';
$allowed = ['EKPOMPH','KRITHS','DIAGWNIZOMENOS'];
if (!in_array($table,$allowed)) die("Λάθος πίνακας");
?>

<!DOCTYPE html>
<html lang="el">
<head>
<meta charset="UTF-8">
<title>Insert <?php echo $table; ?></title>
<link rel="stylesheet" href="style.css">
</head>

<body>
<div class="container">
<div class="card">

<h1>Insert <?php echo $table; ?></h1>



<form method="post" action="insert_exe.php" class="form">
<input type="hidden" name="table" value="<?php echo $table; ?>">

<?php if ($table=="KRITHS"): ?>
<input name="code" placeholder="Κωδικός Κριτή" required>
<input name="name" placeholder="Ονοματεπώνυμο" required>
<input name="exp" placeholder="Έτη Εμπειρίας" required>
<input name="eid" placeholder="Ειδικότητα">

<?php elseif ($table=="DIAGWNIZOMENOS"): ?>
<input name="code" placeholder="Κωδικός Διαγωνιζόμενου" required>
<input name="name" placeholder="Ονοματεπώνυμο" required>
<input name="age" placeholder="Ηλικία">
<input name="talent" placeholder="Ταλέντο" required>

<?php elseif ($table=="EKPOMPH"): ?>
<input name="code" placeholder="Κωδικός Εκπομπής" required>
<input name="name" placeholder="Όνομα Εκπομπής" required>
<input name="date" placeholder="Ημερομηνία (YYYY-MM-DD)" required>
<input name="loc" placeholder="Τοποθεσία">

<?php endif; ?>

<button type="submit" class="back-btn">Εισαγωγή</button>
</form>

<a href="index.html" class="back-btn">⬅ Πίσω στο μενού</a>

</div>
</div>



</body>
</html>
