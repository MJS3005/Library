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
            $_SESSION['role'] = mysqli_fetch_all(mysqli_query($db, ("SELECT `role` FROM `users` WHERE `id` = '$_SESSION[login]' OR `login` = '$_SESSION[login]'")), MYSQLI_ASSOC)[0]['role'];
            
            mysqli_query($db, ("UPDATE `users` SET `status` = 'online' WHERE `id` = '$_SESSION[login]'"));
            mysqli_query($db, ("UPDATE `users` SET `status` = 'online' WHERE `login` = '$_SESSION[login]'"));
            if($_SESSION['role'] == "employee") {
                header("Location: accounting.php");
            } else {
                header("Location: lk.php");    
            }

            if (isset($_POST['login-remember'])) {
                $timeOutCookie = time()+60*60*24*180;
                setcookie("login", $_POST['login'], $timeOutCookie);
            } 
        } else {
            echo "Неверный пароль";
        }
    } else {
        echo "Такой пользователь не найден. Необходимо зарегистрироваться";
    }
};



$pageTitle = "Вход в личный кабинет";
require_once "$path/private/head.php"; 
?>
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