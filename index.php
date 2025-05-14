<?php 
include 'polaczenie.php'; 

if (isset($_POST['dodaj_artykul'])) {
    $tytul = $conn->real_escape_string($_POST['header']);
    $tresc = $conn->real_escape_string($_POST['content']);
    $conn->query("INSERT INTO artykuly (tytul, tresc) VALUES ('$tytul', '$tresc')");
    if ($conn->affected_rows > 0) {
        echo "<script>alert('Artykuł dodany pomyślnie!');</script>";
    } else {
        echo "<script>alert('Wystąpił błąd podczas dodawania artykułu.');</script>";
    }
}
?>



<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Szkola</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <div id="header1"><img id="godlo" src="godlo.png" alt="Godlo Polski"></div>
        <div id="header2">ZSP Praktyki</div>
        <div id="header3"></div>        
    </header>
    <nav id="navigacja" class="navigacja">
        <a href="index.php"><p id="menu">Strona główna</p></a>
        <a href="administracja.php"><p id="menu">Administracja</p></a>
        <a href="dziennik"><p id="menu">Dziennik</p></a>
        <a href="plan_lekcji.php"><p id="menu">Plan lekcji</p></a>
        <a href="kontakt.html"><p id="menu">Kontakt</p></a>


    </nav>
    <hr>
    <main>

        <div id="next">

        <h1>Witamy w Szkole</h1>
        <p>To jest przykładowa strona główna szkoły.</p>
        <p>Znajdziesz tutaj wszystkie potrzebne informacje.</p>
        <h1 id="aktualnosci" >Aktualności i wydarzenia</h1>
        <hr>

        <button type="button" id="article_maker"  onclick="article_maker()">Dodaj artykuł</button>
        
        <section id="formularz" style="display:none;">
            <form method="post">
                <label for="">Dodaj tytuł</label><br>
                <textarea id="content" name="header" rows="4" cols="50" required></textarea><br>
                <label for="">Dodaj treść</label><br>
                <textarea id="content" name="content" rows="4" cols="50" required></textarea><br>
                <button type="submit" name="dodaj_artykul" onclick="dodaj()">Dodaj</button>
                
            </form>
                

        </section>
        <button type="button" id="anuluj" style="display:none;" class="button_article" onclick="anuluj()">Anuluj</button>


        
           




        <section id="articles">
            <article>
            <?php
            $res = $conn->query("SELECT tytul, tresc FROM artykuly  ORDER BY id DESC");

            while ($r = $res->fetch_assoc()) {
                echo "<h2>{$r['tytul']} </h2> <p>{$r['tresc']}</p>";
            }
            ?>
            </article>
        </section>



        </div>
    </main>
</body>
<script>
    function article_maker() {
        document.getElementById("formularz").style.display = "block";
        document.getElementById("anuluj").style.display = "block";
    }


    function anuluj() {
        document.getElementById("formularz").style.display = "none";
        document.getElementById("anuluj").style.display = "none";
    }

    function dodaj() {
        document.getElementById("formularz").style.display = "none";
        document.getElementById("anuluj").style.display = "none";

        
    }
</script>
</html>