<?php
$path = $_SERVER['DOCUMENT_ROOT'];
require_once "$path/system/db.php";

$query = $db->query("SELECT * FROM `users` WHERE `login` = '{$_SESSION['login']}' OR `id` = '{$_SESSION['login']}'");
$role = $query->fetch_assoc()['role'];
if (empty($_SESSION['auth']) or $role !== "employee") {
    header("Location: /index.php");
}

if (isset($_POST['toLend'])) {
    $db->query("UPDATE `users` SET `id_of_borrowed_books` = '{$_POST['booksId']}' WHERE `id` = '{$_POST['usersId']}'");
    $db->query("UPDATE `catalogOfPrintedBooks` SET `status` = 'Нет в наличии; выдана ч/б № {$_POST['usersId']}', `catalog_status` = 'Недоступно' WHERE `id` = '{$_POST['booksId']}'");



    $user = mysqli_fetch_all((mysqli_query($db, "SELECT * FROM users WHERE `id` = '{$_POST['usersId']}'")), MYSQLI_ASSOC);
    $book = mysqli_fetch_all((mysqli_query($db, "SELECT * FROM `catalogOfPrintedBooks` WHERE `id` = '{$_POST['booksId']}'")), MYSQLI_ASSOC);

    $fullUsersName = $user[0]['name'] . " " . $user[0]['patronymic'] . " " . $user[0]['sername'] . "; читательский билет № " . $user[0]['id'];
    $fullBooksName = $book[0]['name'] . ", " . $book[0]['author'] . "; арт. №" . $book[0]['id'];

    $dateOfBorrow = date("Y-m-d");
    $time = time() + 60 * 60 * 3;
    $returnDateU = ($time + 60 * 60 * 3 + 60 * 60 * 24 * 7);
    $returnDate = date('Y-m-d', $returnDateU);



    $sql = "INSERT INTO `borrowed_books`(`id_of_borrowed_book`, `id_of_user`, date_of_borrow, return_date) VALUES ('$fullBooksName', '$fullUsersName', '$dateOfBorrow', '$returnDate')";
    mysqli_query($db, $sql);
    header("Location: /public/accounting.php");

    // $db->query("INSERT INTO `borrowed_books` (`id_of_borrowed_book`, `id_of_user`) VALUES ('{$_POST['booksId']}', '{$_POST['usersId']}')");
}







$pageTitle = "Учет";
require_once "$path/private/head.php";
?>

<body>
    <?php
    require_once "$path/private/header.php";
    ?>
    <main class="accounting-page">
        <h1 class="hidden-element">Учет</h1>
        <div class="login-block">
            <ul class="tabs">
                <li class="title-source-login active-tab"><a>Выдача книг</a></li>
                <li class="title-source-signup"><a href="#">Возврат книг</a></li>
            </ul>
            <form action="" method="post" class="registration-form">
                <div class="form-wrapper">
                    <ul class="login-list">
                        <li><label for="booksId">Артикул издания</label><input type="text" name="booksId" id="booksId" required></li>
                        <li><label for="usersId">Номер читательского билета, на который выдается книга</label><input type="text" name="usersId" id="usersId" required></li>
                        <li><label for="returnDate">Срок возврата книги</label><input type="text" name="returnDate" id="returnDate" value="<?php
                                                                                                                                            $returnDateU = time() + 60 * 60 * 3 + 60 * 60 * 24 * 7;
                                                                                                                                            $returnDate = date('d.m.Y', $returnDateU);
                                                                                                                                            echo $returnDate; ?>"></li>
                    </ul>

                    <button type="submit" name="toLend">Оформить выдачу книги</button>
                </div>
            </form>
        </div>

    </main>
    <?php
    require_once "$path/private/footer.php";
    ?>
</body>

</html>