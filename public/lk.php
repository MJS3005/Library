<?php
$path = $_SERVER['DOCUMENT_ROOT'];
session_start();

if(empty($_SESSION['auth'])) {
    header("Location: /index.php");
}

?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <?php
    require_once "$path/private/head.php"; 
    ?>
    <title>Личный кабинет</title>
</head>

<body>
    <?php
    require_once "$path/private/header.php"; 
    ?>
    <main class="blank_page">
        <h1>Страница находится в разработке</h1>
    </main>
    <?php
    require_once "$path/private/footer.php"; 
    ?>
</body>

</html>