<?php
$path = $_SERVER['DOCUMENT_ROOT'];
require_once "$path/system/db.php";

if (empty($_SESSION['auth'])) {
    if (isset($_COOKIE['login'])) {
        $_SESSION['login'] = $_COOKIE['login'];
        $_SESSION['auth'] == true;
    }
}
if (isset($_POST['logOut'])) {
    $db->query("UPDATE `users` SET `status` = 'offline' WHERE `id` = '{$_SESSION['login']}'");
    mysqli_query($db, ("UPDATE `users` SET `status` = 'offline' WHERE `login` = '$_SESSION[login]'"));
    $_SESSION['auth'] = NULL;
    $_SESSION['login'] = NULL;
    // unset($_COOKIE['login']);
    $_COOKIE['login'] = NULL;
    header("Location: /index.php");
}


?>

<header>
    <div class="main-conteiner-wrapper">
        <div class="main-conteiner">

            <div class="header-top">
                <a class="header-logo" href="/index.php">
                    <div class="logo-first-string">
                        <img src="/img/logo.svg" alt="Логотип библиотеки">
                        <span class="word-library">Библиотека</span>
                    </div>
                    <span class="word-on-mayskaya">на Майской</span>
                </a>
                <div class="adress-and-account-block">
                    <div class="header-contacts-block">
                        <p class="header-contacts-block-adress">г. Санкт-Петербург, ул. Майская, д. 10
                            </br>
                            тел.: <a href="tel:+78120505050">+7-812-050-50-50</a>
                        </p>
                        <p class="header-contacts-block-schedule">ПН-ПТ: с 9 до 21 ч.<br>
                            СБ, ВС: с 11 до 19 ч.</p>
                    </div>
                    <?php
                    if ($_SESSION['auth'] == true) { ?>
                        <p class="account authorized"><a href="/public/lk.php">
                                <?php
                                $query = $db->query("SELECT * FROM `users` WHERE `login` = '{$_SESSION['login']}' OR `id` = '{$_SESSION['login']}'");
                                $login = $query->fetch_assoc()['login'];
                                echo $login;
                                ?></a></p>
                        <form action="" method="post" class="exit-button-form">
                            <button type="submit" class="exit-button" name="logOut" value="exit" title="Выйти"><span class="hidden-element">Выход</span></button>
                        </form>
                    <?php } else { ?>
                        <p class="account unauthorized"><a href="/public/login.php">Личный кабинет</a></p>
                    <?php } ?>
                </div>
            </div>
            <div class="header-bottom">
                <nav>
                    <ul>
                        <li>
                            <a href="#">О нас</a>
                        </li>
                        <li>
                            <a href="#">Услуги</a>
                        </li>
                        <li>
                            <a href="#">Мероприятия</a>
                        </li>
                        <li>
                            <a href="#">Новости</a>
                        </li>
                        <li>
                            <a href="#">Читателю</a>
                        </li>
                        <li>
                            <a href="#">Контакты</a>
                        </li>
                    </ul>
                </nav>
                <form action="" method="get">
                    <input type="search" placeholder="Поиск по сайту">
                </form>
            </div>
        </div>
    </div>
</header>