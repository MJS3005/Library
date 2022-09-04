<?php
$path = $_SERVER['DOCUMENT_ROOT'];
session_start();

if(empty($_SESSION['auth'])) {
    header("Location: /index.php");
}

if($_SESSION['role'] == "employee") {
    header("Location: accounting.php");
} 


$pageTitle = "Личный кабинет";
require_once "$path/private/head.php"; 
?>

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