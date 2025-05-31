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
    <div class="title text-center">
        <h1>Inscription</h1>
    </div>

    <?php
    try {
        $bdd = new PDO('mysql:host=localhost;dbname=projet_profan;charset=utf8', 'root', '');
    } catch (Exception $e) {
        die('Erreur : ' . $e->getMessage());
    }

    if ((!isset($_POST['droit'])) AND (!isset($_POST['mail'])) AND (!isset($_POST['mot_de_passe'])) AND ((!isset($_POST['nom_de_compte']))) AND ((!isset($_POST['confirmation_mot_de_passe'])))) {
        ?>
        <div class="col-sm-10 offset-1 col-md-5 offset-3 formulaire">
            <?php include 'templates/inscription_form.html'; ?>
        </div>
        <?php
    } elseif (($_POST['droit'] == "") OR ($_POST['mail'] == "") OR ($_POST['nom_de_compte'] == "") OR $_POST['confirmation_mot_de_passe'] == "" OR ($_POST['mot_de_passe'] == "")) {
        ?>
        <div class="col-sm-10 offset-1 col-md-5 offset-3 formulaire">
            <p class="alert alert-danger">Veuillez remplir tous les champs.</p>
            <?php include 'templates/inscription_form.html'; ?>
        </div>
        <?php
    } else {
        if ($_POST['mot_de_passe'] != $_POST['confirmation_mot_de_passe']) {
            ?>
            <div class="col-sm-10 offset-1 col-md-5 offset-3 formulaire">
                <p class="alert alert-danger">Veuillez rentrez deux fois le même mot de passe !</p>
                <?php include 'templates/inscription_form.html'; ?>
            </div>
            <?php
        } else {
            $req = $bdd->query('SELECT id FROM websiteuser');
            $correct = 0;
            while ($resultat = $req->fetch()) {
                if ($_POST['nom_de_compte'] == $resultat['id']) {
                    $correct = 1;
                }


            }
            $req->closeCursor();
            if ($correct == 1) {
                ?>
                <div class="col-sm-10 offset-1 col-md-5 offset-3 formulaire">
                    <p class="alert alert-danger">Nom de compte déjà éxistant.</p>
                    <?php include 'templates/inscription_form.html'; ?>
                </div>
                <?php
            } else {
                $ajout = $bdd->prepare('INSERT INTO websiteuser(id, MotDePasse, email, droits)
                    VALUES(:pseudo, :mdp, :mail, :droit)');

                $pass_hache = password_hash($_POST['mot_de_passe'], PASSWORD_DEFAULT);

                $ajout->execute(array(
                    'pseudo' => $_POST['nom_de_compte'],
                    'mdp' => $pass_hache,
                    'mail' => $_POST['mail'],
                    'droit' => $_POST['droit']
                ));
                ?>
                <div class="col-sm-10 offset-1 col-md-5 offset-3 formulaire">
                    <p class="alert alert-success">Votre compte a été créé.</p>
                    <br/>
                    <a href="index.php">Page de connexion</a>
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
