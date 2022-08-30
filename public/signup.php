<?
$path = $_SERVER['DOCUMENT_ROOT'];
require_once "$path/system/db.php";

if($_SESSION['auth'] == true) {
    header("Location: lk.php");
}

if(isset($_POST['send'])) {
    $error = [];

    if($_POST['login'] === "") {
        $error[] = "Введите имя пользователя";
    }
    $query = $db->query("SELECT * FROM `users` WHERE `login` = '{$_POST['login']}'");
    if ($query->num_rows > 0) {
        $error[] = "Это имя пользователя уже занято, выберите другое";
    }

    $queryEmail = $db->query("SELECT * FROM `users` WHERE `email` = '{$_POST['email']}'");
    if ($queryEmail->num_rows > 0) {
        $error[] = "Пользователь с таким email уже зарегистрирован";
    }

    if($_POST['password'] === "") {
        $error[] = "Введите пароль";
    }
    if($_POST['confirm-password'] === "") {
        $error[] = "Повторите пароль";
    }

    if($_POST['password'] !== $_POST['confirm-password']) {
        $error[] = "Пароли не совпадают";
    }

    if(empty($error)) { 
        $_POST['password'] = password_hash($_POST['password'], false);
        $time = time();
        $db->query("INSERT INTO `users` (`login`, `password`, `name`, `patronymic`, `sername`, `email`, `birth_date`, `time_signup`) VALUES('{$_POST['login']}', '{$_POST['password']}', '{$_POST['name']}', '{$_POST['patronymic']}', '{$_POST['sername']}', '{$_POST['email']}', '{$_POST['birthdate']}', $time)"); 
        header("Location: login.php");
    } else {
        echo $error[0];
    }

}

?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <?php
    require_once "$path/private/head.php"; 
    ?>
    <title>Регистрация</title>
</head>

<body>
<?php
    require_once "$path/private/header.php"; 
    ?>
   <main>
      <h1 class="hidden-element">Форма регистрации нового пользователя</h1>
      <div class="registration-block">
         <ul class="tabs">
            <li class="title-source-login"><a href="/public/login.php">Вход</a></li>
            <li class="title-source-signup active-tab"><a>Регистрация</a></li>
         </ul>
         <form action="" method="post" class="registration-form">
            <div class="form-wrapper">
               <ul>
                  <li><label for="sername">Фамилия</label><input type="text" name="sername" id="sername" required></li>
                  <li><label for="name">Имя</label><input type="text" name="name" id="name" required></li>
                  <li><label for="patronymic">Отчество</label><input type="text" name="patronymic" id="patronymic"></li>
                  <li><label for="birthDate">Дата рождения</label><input type="text" name="birthdate" id="birthDate"
                        required>
                  </li>
                  <li><label for="login">Имя пользователя</label><input type="text" name="login" id="login" required>
                  </li>
                  <li><label for="email">Email</label><input type="email" name="email" id="email" required></li>
                  <li><label for="password">Пароль</label><input type="password" name="password" id="password">
                  </li>
                  <li><label for="confirmPassword">Подтвердите пароль</label><input type="password"
                        name="confirm-password" id="confirmPassword"></li>

               </ul>
               <p class="agree-checkbox">
                  <input type="checkbox" name="terms-of-use" value="agree" id = "termsOfUse" required>
                  <label for = "termsOfUse">Я согласен с&nbsp;</label><a href="#">Условиями использования материалов сайта</a>
               </p>
               <button type="submit" name = "send">Зарегистрироваться</button>
            </div>
         </form>
      </div>
   </main>
   <?php
    require_once "$path/private/footer.php"; 
    ?>
    <script>
        let form = document.querySelector(".registration-form");
        let password = document.getElementById("password");
        let confirmPassword = document.getElementById("confirmPassword");
        form.onsubmit = () => {
            if(password.value == "") {
                alert("Введите пароль");
                event.preventDefault();
            } else if (password.value !== confirmPassword.value) {
                alert("Пароли не совпадают");
                event.preventDefault();
            }
        }
        </script>
</body>

</html>