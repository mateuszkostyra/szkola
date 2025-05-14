<?php 
include 'polaczenie.php'; 

if (isset($_POST['dodaj_ucznia'])) {
    $imie = $conn->real_escape_string($_POST['imie']);
    $nazwisko = $conn->real_escape_string($_POST['nazwisko']);
    $rola = $conn->real_escape_string($_POST['rola']);
    $conn->query("INSERT INTO osoby (imie, nazwisko, rola) VALUES ('$imie', '$nazwisko', '$rola')");
    header("Location: index.php");
}

if (isset($_POST['usun_ucznia'])) {
    $imie = $conn->real_escape_string($_POST['imie']);
    $nazwisko = $conn->real_escape_string($_POST['nazwisko']);
    $rola = $conn->real_escape_string($_POST['rola']);
    $conn->query("DELETE FROM osoby WHERE imie='$imie' AND nazwisko = '$nazwisko' AND rola= '$rola'");
    header("Location: index.php");
}

if (isset($_POST['dodaj_klase'])) {
    $nazwa = $conn->real_escape_string($_POST['nazwa']);
    $rok = (int)$_POST['rok'];
    $conn->query("INSERT INTO klasy (nazwa, rok_nauki) VALUES ('$nazwa', $rok)");
    header("Location: index.php");
}

if (isset($_POST['usun_klase'])) {
    $nazwa = $conn->real_escape_string($_POST['nazwa']);
    $conn->query("DELETE FROM klasy WHERE nazwa='$nazwa'");
    header("Location: index.php");
}

if (isset($_POST['przypisz'])) {
    $uczen_id = (int)$_POST['uczen_id'];
    $klasa_id = (int)$_POST['klasa_id'];
    $conn->query("INSERT INTO osoby_klasy (id_osoby, id_klasy) VALUES ($uczen_id, $klasa_id)");
    header("Location: index.php");
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

   
    


    <div id="next">


        <div class="przyciski_kafelki">
            <div id="add_person" onclick="add_person()" class="kafelek">Dodaj osobę</div>
            <div id="add_class" onclick="add_class()" class="kafelek">Dodaj klasę</div>
            <div id="add_ptc" onclick="add_ptc()" class="kafelek">Przypisz osobę<br> do klasy</div>
            <div id="wykaz" onclick="wykazy()"  class="kafelek">Wyświetl<br> wykazy</div>
            <div id="listy" onclick="listy()"  class="kafelek">Sprawdż listy</div>
            <div id="start" onclick="start()" class="kafelek">Start</div>
        </div>

    <div id="start_d" style="display:block">
        <h2>Witaj w systemie administracyjnym</h2>
        <p>Wybierz jedną z opcji z menu, aby rozpocząć.</p>
    </div>




    <div id="dodaj_osobe" style="display:none">
        <h2>Dodaj osobę</h2>
        <form method="post">
            Imie: <input type="text" name="imie" required> <br>
            Nazwisko: <input type="text" name="nazwisko" required> <br>
            Rola: <input type="text" name="rola" required> <br>
            <button type="submit" name="dodaj_ucznia">Dodaj</button>
        </form>

        <h2>Usuń osobę</h2>
        <form method="post">
            Imie: <input type="text" name="imie" required> <br>
            Nazwisko: <input type="text" name="nazwisko" required> <br>
            Rola: <input type="text" name="rola" required> <br>
            <button type="submit" name="usun_ucznia">Usuń</button>
        </form>
    </div>


    <div id="dodaj_klase" style="display:none" >
        <h2>Dodaj klase</h2>
        <form method="post">
            Nazwa klasy: <input type="text" name="nazwa" required><br>
            Rok nauki: <input type="number" name="rok" required><br>
            <button type="submit" name="dodaj_klase">Dodaj</button>
        </form>
        <h2>Usuń klase</h2>
        <form method="post">
            Nazwa klasy: <input type="text" name="nazwa" required><br>
            <button type="submit" name="usun_klase">Usuń</button>
        </form>
    </div>


    <div id="przypisz_ucznia" style="display:none" >
        <h2>Przypisz ucznia do klasy</h2>
        <form method="post">
            <select name="uczen_id">
                <?php
                $res = $conn->query("SELECT id, imie, nazwisko FROM osoby WHERE rola='uczen'");
                while ($r = $res->fetch_assoc()) {
                    echo "<option value='{$r['id']}'>{$r['imie']} {$r['nazwisko']}</option>";
                }
                ?>
            </select>
            <select name="klasa_id">
                <?php
                $res = $conn->query("SELECT id, nazwa FROM klasy");
                while ($r = $res->fetch_assoc()) {
                    echo "<option value='{$r['id']}'>{$r['nazwa']}</option>";
                }
                ?>
            </select><br>
            <button type="submit" name="przypisz">Przypisz</button>
        </form>
    </div>


    <div id="wykazy" style="display:none" >
        <div id="przypisy_u">
            <h2>Wykaz uczniów przypisanych</h2>
            <ul>
            <?php
            $res = $conn->query("SELECT o.imie, o.nazwisko, k.nazwa FROM osoby_klasy ok JOIN osoby o ON ok.id_osoby = o.id JOIN klasy k ON ok.id_klasy = k.id WHERE o.rola='uczen'");
            while ($r = $res->fetch_assoc()) {
                echo "<li>{$r['imie']} {$r['nazwisko']} → {$r['nazwa']}</li>";
            }
            ?>
            </ul>
        </div>



        <div id="przypisy_n" >
            <h2>Wykaz pracowników</h2>
                <ul>
                <?php
                $res = $conn->query("SELECT o.imie, o.nazwisko FROM osoby o WHERE o.rola != 'uczen'");
                while ($r = $res->fetch_assoc()) {
                    echo "<li>{$r['imie']} {$r['nazwisko']}</li>";
                }
                ?>
                </ul>
        </div>

        <div id="przypisy_o" >
            <h2>Wykaz osób nieprzypisanych</h2>
                <ul>
                <?php
                 $res = $conn->query("SELECT CONCAT(osoby.imie, ' ',  osoby.nazwisko) AS 'imie i nazwisko'
                                        FROM osoby
                                        LEFT JOIN osoby_klasy ON osoby.id = osoby_klasy.id_osoby
                                        WHERE osoby_klasy.id_osoby IS NULL AND osoby.rola IN ('uczen', 'nauczyciel')");
                while ($r = $res->fetch_assoc()) {
                    echo "<li>{$r['imie i nazwisko']} </li>";
                }
                ?>
                </ul>
        </div>
    
            </div>
    

    <div id="listy_klas" style="display:none">
        <h2>Uczniowie w wybranej klasie</h2>
            <form method="get">
                <select name="klasa_id">
                    <option value="">-- Wybierz klasę --</option>
                    <?php
                    $res = $conn->query("SELECT id, nazwa FROM klasy");
                    while ($r = $res->fetch_assoc()) {
                        $selected = (isset($_GET['klasa_id']) && $_GET['klasa_id'] == $r['id']) ? 'selected' : '';
                        echo "<option value='{$r['id']}' $selected>{$r['nazwa']}</option>";
                    }
                    ?>
                </select>
                <button type="submit">Pokaż</button>
            </form>
                
            <?php
                
if (isset($_GET['klasa_id']) && $_GET['klasa_id'] != '') {
                $klasa_id = (int)$_GET['klasa_id'];
                $res_nazwa = $conn->query("SELECT nazwa FROM klasy WHERE id = $klasa_id");
                if ($res_nazwa && $res_nazwa->num_rows > 0) {
                    $nazwa = $res_nazwa->fetch_assoc()['nazwa'];
                    echo "<h3>Uczniowie klasy: $nazwa</h3><ul>";
                    $res_uczniowie = $conn->query("SELECT o.imie, o.nazwisko FROM osoby_klasy ok JOIN osoby o ON ok.id_osoby = o.id WHERE ok.id_klasy = $klasa_id AND o.rola='uczen'");
                    if ($res_uczniowie->num_rows > 0) {
                        while ($u = $res_uczniowie->fetch_assoc()) {
                            echo "<li>{$u['imie']} {$u['nazwisko']}</li>";
                        }
                    } else {
                        echo "<li><i>Brak uczniów w tej klasie</i></li>";
                    }
                    echo "</ul>";
                   
                }
            }
            ?>
            </div>
    </div>
    </div>
</body>


<script>
    

    function add_person() {
        document.getElementById("dodaj_osobe").style.display = "block";
        document.getElementById("dodaj_klase").style.display = "none";
        document.getElementById("przypisz_ucznia").style.display = "none";
        document.getElementById("wykazy").style.display = "none";
        document.getElementById("listy_klas").style.display = "none";
        document.getElementById("start_d").style.display = "none";

    }

    function add_class() {
        document.getElementById("dodaj_osobe").style.display = "none";
        document.getElementById("dodaj_klase").style.display = "block";
        document.getElementById("przypisz_ucznia").style.display = "none";
        document.getElementById("wykazy").style.display = "none";
        document.getElementById("listy_klas").style.display = "none";
        document.getElementById("start_d").style.display = "none";
    }

    function add_ptc() {
        document.getElementById("dodaj_osobe").style.display = "none";
        document.getElementById("dodaj_klase").style.display = "none";
        document.getElementById("przypisz_ucznia").style.display = "block";
        document.getElementById("wykazy").style.display = "none";
        document.getElementById("listy_klas").style.display = "none";
        document.getElementById("start_d").style.display = "none";
    }

    function wykazy() {
        document.getElementById("dodaj_osobe").style.display = "none";
        document.getElementById("dodaj_klase").style.display = "none";
        document.getElementById("przypisz_ucznia").style.display = "none";
        document.getElementById("wykazy").style.display = "block";
        document.getElementById("listy_klas").style.display = "none";
        document.getElementById("start_d").style.display = "none";
        
    }
    function listy() {
        document.getElementById("dodaj_osobe").style.display = "none";
        document.getElementById("dodaj_klase").style.display = "none";
        document.getElementById("przypisz_ucznia").style.display = "none";
        document.getElementById("wykazy").style.display = "none";
        document.getElementById("listy_klas").style.display = "block";
        document.getElementById("start_d").style.display = "none";
    }
    function start() {
        document.getElementById("dodaj_osobe").style.display = "none";
        document.getElementById("dodaj_klase").style.display = "none";
        document.getElementById("przypisz_ucznia").style.display = "none";
        document.getElementById("wykazy").style.display = "none";
        document.getElementById("listy_klas").style.display = "none";
        document.getElementById("start_d").style.display = "block";
    }








</script>
</html>