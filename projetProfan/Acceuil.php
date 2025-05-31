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
<body>

<header>
    <?php include "templates/header.html" ?>
</header>

<main class="homepage-container text-center">
    <?php

    if (isset($_SESSION['id']) AND isset($_SESSION['pseudo'])) {
        $pers = 'Bonjour ' . $_SESSION['pseudo'];
    }
    ?>

    <h1>Imprimerie Lycée La Fayette</h1>
    <h2><?php echo $pers ?></h2>

    <div class="links col-sm-10 col-md-6 offset-md-3 col-lg-4 offset-lg-4">
        <a href="commande.php" class="btn btn-secondary">Faire une commande</a>
        <a href="liste_commande.php" class="btn btn-secondary">Liste des commande</a>
    </div>
</main>

<footer>
    <?php include "templates/footer.html" ?>
</footer>
</body>

</html>