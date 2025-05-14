<?php
// polaczenie.php - plik laczacy z baza danych
$host = 'localhost';
$db = 'szkola';
$user = 'root';
$pass = '';

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die('Blad polaczenia: ' . $conn->connect_error);
}
?>
