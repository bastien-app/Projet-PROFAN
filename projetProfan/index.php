<!DOCTYPE html>
<html lang="FR">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <title>PROFAN GPAO</title>
    <link href="images/logo-lycee-la-fayette.png" rel="shortcut icon" type="image/png"/>
</head>


<body>
<header>
    <?php include "templates/header.html" ?>
</header>
<main>
<?php
try {
    $bdd = new PDO('mysql:host=localhost;dbname=projet_profan;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}


if ((!isset($_POST['mot_de_passe'])) AND ((!isset($_POST['login'])))) {
    ?>
    <div class="col-sm-10 offset-1 col-md-5 offset-3 formulaire">
        <form action="index.php" method="post">
            <div class="form-group">
                <label for="login">Indentifiant</label>
                <input class="form-control" type="text" name="login" id="login"/>
            </div>
            <div class="form-group">
                <label for="mot_de_passe">Password</label>
                <input type="password" class="form-control" id="mot_de_passe" name="mot_de_passe">
            </div>

            <div class="form-inline">
            <button type="submit" class="btn btn-primary">Valider</button>
            <a class="btn" href="inscription.php">Inscription</a>
            </div>
        </form>
    </div>
    <?php
} else {

    $req = $bdd->prepare('SELECT id, MotDePasse from websiteuser where id = :idlogin');
    $req->execute(array(
        'idlogin' => $_POST['login']));

    $resultat = $req->fetch();

    $ispasswordcorrect = password_verify($_POST['mot_de_passe'], $resultat['MotDePasse']);

    if (!$resultat) {

        ?>
        <div class="col-sm-10 offset-1 col-md-5 offset-3 formulaire">
            <p class="alert alert-danger">Mauvais identifiant ou mot de passe !</p>

            <form action="index.php" method="post">
                <div class="form-group">
                    <label for="login">Indentifiant</label>
                    <input class="form-control" type="text" name="login" id="login"/>
                </div>
                <div class="form-group">
                    <label for="mot_de_passe">Password</label>
                    <input type="password" class="form-control" id="mot_de_passe" name="mot_de_passe">
                </div>

                <div class="form-inline">
                    <button type="submit" class="btn btn-primary">Valider</button>
                    <a class="btn" href="inscription.php">Inscription</a>
                </div>
            </form>
        </div>
        <?php

    } else {

        if ($ispasswordcorrect) {
            session_start();
            $_SESSION['id'] = $resultat['id'];
            $_SESSION['pseudo'] = $_POST['login'];
            header('location: Acceuil.php');
        } else {
            ?>
            <div class="col-sm-10 offset-1 col-md-5 offset-3 formulaire">
                <p class="alert alert-danger">Mauvais identifiant ou mot de passe !</p>

                <form action="index.php" method="post">
                    <div class="form-group">
                        <label for="login">Indentifiant</label>
                        <input class="form-control" type="text" name="login" id="login"/>
                    </div>
                    <div class="form-group">
                        <label for="mot_de_passe">Password</label>
                        <input type="password" class="form-control" id="mot_de_passe" name="mot_de_passe">
                    </div>

                    <div class="form-inline">
                        <button type="submit" class="btn btn-primary">Valider</button>
                        <a class="btn" href="inscription.php">Inscription</a>
                    </div>
                </form>
            </div>
            <?php
        }
    }
}

?>
</main>

<footer>
    <?php include "templates/footer.html" ?>
</footer>
</body>

</html>