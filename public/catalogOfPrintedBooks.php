<?php
$path = $_SERVER['DOCUMENT_ROOT'];
require_once "$path/system/db.php";

$pageTitle = "Каталог печатных изданий";
require_once "$path/private/head.php";

function createOption($arr)
{
    if (count($arr[0]) > 0) {
        foreach ($arr as $row) { ?>
            <option value="<?php echo $row['name'] ?>">
            <?php  }
    }
}

function createRowOfCatalog($query)
{
    $rows = mysqli_fetch_all($query, MYSQLI_ASSOC);

    foreach ($rows as $key) {
            ?>
            <tr>
                <td class="vendor-code"><?php echo $key['id'] ?></td>
                <td class="books-name"><?php echo $key['name'] ?></td>
                <td class="author"><?php echo $key['author'] ?></td>
                <td class="status"><?php echo $key['catalog_status'] ?></td>
            </tr>
    <?php
    }
}

function getAllCatalog()
{
    $query = mysqli_query((mysqli_connect("localhost", "root", "", "library")), ("SELECT `id`, `name`, `author`, `catalog_status` FROM `catalogOfPrintedBooks`"));
    createRowOfCatalog($query);
}

    ?>

    <body>
        <?php
        require_once "$path/private/header.php";
        ?>

        <main class="catalogs-main-page">
            <h1>Каталог печатных изданий</h1>
            <div class="catalogOfPrintedBooksFilterBlock">
                <form action="" method="get">
                    <div class="formsSelect">
                        <p class="set-filter">Отбор: </p>
                        <div id="filterName">
                            <p>по названию</p>
                            <input list="booksId" name="name" autocomplete="off">
                            <datalist name="booksId" id="booksId">
                                <?php

                                $queryBooks = $db->query("SELECT `name` FROM `publications`");
                                $optionsBook = mysqli_fetch_All($queryBooks, MYSQLI_ASSOC);
                                createOption($optionsBook);
                                ?>
                                <!-- <option value="Барышня-крестьянка">
                            <option value="Герой нашего времени"> -->
                            </datalist>
                        </div>
                        <div id="filterAuthor">
                            <p>по автору</p>
                            <input list="authorId" name="author" autocomplete="off">
                            <datalist name="authorIdData" id="authorId">
                                <?php
                                $queryAuthors = $db->query("SELECT `name` FROM `authors`");
                                $optionsAuthor = mysqli_fetch_All($queryAuthors, MYSQLI_ASSOC);
                                createOption($optionsAuthor);
                                ?>
                                <!-- <option value="Пушкин Александр Сергеевич">
                            <option value="Лермонтов Михаил Юрьевич"> -->
                            </datalist>
                        </div>

                        <div id="filterStatus">
                            <p>по статусу</p>
                            <input list="statusId" name="catalog_status" autocomplete="off">
                            <datalist name="statusId" id="statusId">
                                <?php
                                $queryStatuses = $db->query("SELECT `name` FROM `statuses`");
                                $optionsStatus = mysqli_fetch_All($queryStatuses, MYSQLI_ASSOC);
                                createOption($optionsStatus);
                                ?>
                                <!-- <option value="Свободно">
                            <option value="Недоступно"> -->
                            </datalist>
                        </div>
                    </div>

                    <div class="forms-buttons">
                        <button type="submit" name="filterBtn" value="filter">Установить фильтр</button>
                        <button type="submit" name="filterClearBtn">Сбросить фильтр</button>
                    </div>
                </form>
            </div>
            <table id="catalogOfPrintedBooksTable" class="catalog-table">
                <tr>
                    <th>Артикул</th>
                    <th>Название</th>
                    <th>Автор</th>
                    <th>Статус</th>
                </tr>
                <?php

                if (isset($_GET['filterBtn'])) {
                    $string = '';
                    foreach ($_GET as $key => $value) {
                        if ($value != 'null' && $value != '' && $value != 'filter') {
                            $string = $string . "`" . $key . "` = '" . $value . "' AND ";
                        }
                    }
                    $string = rtrim($string, " AND ");
                    // echo $string;
                    if ($string == null) {
                        getAllCatalog();
                    } else {
                        $query = mysqli_query($db, ("SELECT `id`, `name`, `author`, `catalog_status` FROM `catalogOfPrintedBooks` WHERE  $string "));
                        createRowOfCatalog($query);
                    }
                } else {
                    if (empty($_GET['filterBtn']) or isset($_GET['filterClearBtn'])) {
                        getAllCatalog();
                    }
                }

                ?>
                <!-- <tr>
                <td class = "vendor-code">1</td>
                <td class="books-name">Барышня-крестьянка</td>
                <td class="author">Пушкин А.С.</td>
                <td class="status">Свободна</td>
            </tr>
            <tr>
                <td class = "vendor-code">2</td>
                <td class="books-name">Герой нашего времени</td>
                <td class="author">Лермонтов М.Ю.</td>
                <td class="status">Недоступна</td>
            </tr> -->
            </table>
        </main>

        <?php
        require_once "$path/private/footer.php";
        ?>


    </body>

    </html>