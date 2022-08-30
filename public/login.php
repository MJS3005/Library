<?php
$path = $_SERVER['DOCUMENT_ROOT'];
require_once "$path/system/db.php";

if($_SESSION['auth'] == true) {
    header("Location: lk.php");
}

if(isset($_POST['send'])) {
   
    $query = $db->query("SELECT * FROM `users` WHERE `login` = '{$_POST['login']}' OR `id` = '{$_POST['login']}'");

    if ($query->num_rows > 0) {
        $password = $query->fetch_assoc()['password'];

        if(password_verify($_POST['password'], $password)){
            $_SESSION['auth'] = true;
            $_SESSION['login'] = $_POST['login'];

            $db->query("UPDATE `users` SET `status` = 'online' WHERE `login` = '{$_SESSION['login']}' OR `id` = '{$_SESSION['login']}'");
            header("Location: lk.php");

        } else {
            echo "Неверный пароль";
        }
    } else {
        echo "Такой пользователь не найден. Необходимо зарегистрироваться";
    }
};

?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <?php
    require_once "$path/private/head.php"; 
    ?>
    <title>Вход в личный кабинет</title>
</head>

<body>
    <?php
    require_once "$path/private/header.php"; 
    ?>
    <main>
        <h1 class="hidden-element">Вход в личный кабинет пользователя</h1>
        <div class="login-block">
            <ul class="tabs">
                <li class="title-source-login active-tab"><a>Вход</a></li>
                <li class="title-source-signup"><a href="/public/signup.php">Регистрация</a></li>
            </ul>
            <form action="" method="post" class="registration-form">
                <div class="form-wrapper">
                    <ul class="login-list">
                        <li><label for="login">Номер читательского билета или Имя пользователя</label><input
                                type="text" name="login" id="login" required></li>
                        <li><label for="password">Пароль</label><input type="password" name="password"
                                id="password" required></li>
                    </ul>
                    <div class="login-form-bottom">
                        <a href="#">Забыли пароль?</a>
                        <label class="login-agree-checkbox">
                            <input type="checkbox" name="login-remember" value="yes">
                            <p>Запомнить меня</p>
                        </label>
                    </div>
                    <button type="submit" name = "send">Войти</button>
                </div>
            </form>
        </div>
    </main>
    <?php
    require_once "$path/private/footer.php"; 
    ?>
</body>

</html>