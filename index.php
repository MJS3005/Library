<?
$path = $_SERVER['DOCUMENT_ROOT'];
session_start();


$pageTitle = 'Библиотека на Майской';
require_once "$path/private/head.php"; 
?>    
<body>
    <?php
    require_once "$path/private/header.php"; 
    ?>
    <main class="main-page">
        <div class="main-page-block">
            <h1 class="hidden-element">Библиотека на Майской</h1>

            <section class="main-page-photo-gallery">
                <h2 class="hidden-element">Фотогалерея</h2>
                <div class="main-page-photo-gallery-photo"><img src="img/library-building.jpg"
                        alt="Здание библиотеки со стороны набережной"></div>
                <div class="main-page-photo-gallery-photo"><img src="img/library.jpg"
                        alt="Зал библиотеки со стеллажами книг"></div>
                <div class="main-page-photo-gallery-photo"><img src="img/girl-in-library.jpg"
                        alt="Девушка в читальном зале"></div>
            </section>

            <section class="book-search">
                <h2 class="hidden-element">Поиск изданий</h2>

                <div class="book-search-catalogs">
                    <a href = "public/catalogOfPrintedBooks.php">Каталог печатных изданий</a>
                    <a href="#">Электронная библиотека</a>
                </div>

                <div class="book-search-forms">
                    <div>
                        <h3>Поиск печатного издания</h3>
                        <form action="#" method="get">
                            <input type="text" name="name-of-the-book" placeholder="Введите название">
                            <input type="text" name="author" placeholder="Введите автора">
                            <button type="submit">Найти</button>
                        </form>
                        <button type="button" class="random-book">Показать случайную книгу</button>
                    </div>

                    <div>
                        <h3>Поиск электронного издания</h3>
                        <form action="#" method="get">
                            <input type="text" name="name-of-the-book" placeholder="Введите название">
                            <input type="text" name="author" placeholder="Введите автора">
                            <button type="submit">Найти</button>
                        </form>
                        <button type="button" class="random-book">Показать случайную книгу</button>
                    </div>
                </div>
            </section>
            <div class="main-page-news-and-events">

                <section class="main-page-news">
                    <h2>Новости</h2>
                    <ul>

                        <li>
                            <time></time>
                            <h3></h3>
                            <p></p>
                        </li>

                        <li>
                            <time></time>
                            <h3></h3>
                            <p></p>
                        </li>

                        <li>
                            <time></time>
                            <h3></h3>
                            <p></p>
                        </li>

                    </ul>
                </section>

                <section class="main-page-events">
                    <h2>Наши мероприятия</h2>
                    <ul>
                        <li>
                            <time></time>
                            <p></p>
                            <p></p>
                        </li>

                        <li>
                            <time></time>
                            <p></p>
                            <p></p>
                        </li>

                        <li>
                            <time></time>
                            <p></p>
                            <p></p>
                        </li>

                        <li>
                            <time></time>
                            <p></p>
                            <p></p>
                        </li>

                    </ul>

            </div>
        </div>
    </main>
    <?php
    require_once "$path/private/footer.php"; 
    ?>

</body>

</html>