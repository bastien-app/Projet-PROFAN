<?php
    session_start();
    if (!(isset($_SESSION['id']) AND isset($_SESSION['pseudo'])))
    {
        header("Location: index.php");
    }
    ?>
<!DOCTYPE html>
<html lang="FR">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css"/>
    <title>PROFAN GPAO</title>
    <link href="images/logo-lycee-la-fayette.png" rel="shortcut icon" type="image/png"/>
</head>

<?php

?>

<body>
<header>
    <?php include "templates/header.html" ?>
</header>
<main>
<?php
if (isset($_SESSION['id']) AND isset($_SESSION['pseudo'])) {
    echo 'Bonjour ' . $_SESSION['pseudo'];
}
?>
<form action="envoi_commandes.php" method="post">
    <input class="" type="text" name="" placeholder=""/>
    <input class="" type="text" name="" placeholder=""/>
    <input class="" type="text" name="" placeholder=""/>
    
</form>
</main>

<footer>
    <?php include "templates/footer.html" ?>
</footer>
</body>
</html>