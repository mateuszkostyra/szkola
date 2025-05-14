<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plan lekcji</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f0f0f0;">
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


    <h1 class="mb-4">Plan lekcji</h1>
    
    <?php
    include 'polaczenie.php'; 

    $classes = [];
    $class_result = $conn->query("SELECT id, nazwa FROM klasy");
    while($row = $class_result->fetch_assoc()) {
        $classes[$row['id']] = $row['nazwa'];
    }
    $selected_class = $_POST['class'] ?? array_key_first($classes);
    ?>

    <form method="post" class="mb-4">
        <select name="class" class="form-select" onchange="this.form.submit()">
            <?php foreach($classes as $id => $name): ?>
                <option value="<?= $id ?>" <?= $id == $selected_class ? 'selected' : '' ?>>
                    <?= htmlspecialchars($name) ?>
                </option>
            <?php endforeach; ?>
        </select>
    </form>

    <?php
    $stmt = $conn->prepare("
        SELECT pl.dzien_tygodnia, pl.nr_lekcji, p.nazwa AS przedmiot, 
               CONCAT(o.imie, ' ', o.nazwisko) AS nauczyciel, pl.sala 
        FROM plan_lekcji pl
        JOIN przedmioty p ON pl.id_przedmiotu = p.id
        JOIN osoby o ON pl.id_nauczyciela = o.id
        WHERE pl.id_klasy = ?
        ORDER BY FIELD(pl.dzien_tygodnia, 'Poniedzialek', 'Wtorek', 'Sroda', 'Czwartek', 'Piatek'), pl.nr_lekcji
    ");
    
    $stmt->bind_param("i", $selected_class);
    $stmt->execute();
    $result = $stmt->get_result();

    $schedule = [];
    while($row = $result->fetch_assoc()) {
        $schedule[$row['dzien_tygodnia']][$row['nr_lekcji']] = [
            'przedmiot' => $row['przedmiot'],
            'nauczyciel' => $row['nauczyciel'],
            'sala' => $row['sala']
        ];
    }
    ?>

    <table class="table table-bordered lesson-table">
        <thead>
            <tr>
                <th>Nr</th>
                <?php
                $days = ['Poniedzialek', 'Wtorek', 'Sroda', 'Czwartek', 'Piatek'];
                foreach($days as $day) {
                    echo "<th>" . htmlspecialchars(ucfirst($day)) . "</th>";
                }
                ?>
            </tr>
        </thead>
        <tbody>
            <?php for($lesson = 1; $lesson <= 7; $lesson++): ?>
                <tr>
                    <th><?= $lesson ?></th>
                    <?php foreach($days as $day): ?>
                        <td class="lesson-cell">
                            <?php if(isset($schedule[$day][$lesson])): ?>
                                <div class="fw-bold"><?= htmlspecialchars($schedule[$day][$lesson]['przedmiot']) ?></div>
                                <div><?= htmlspecialchars($schedule[$day][$lesson]['nauczyciel']) ?></div>
                                <div class="text-muted">s. <?= htmlspecialchars($schedule[$day][$lesson]['sala']) ?></div>
                            <?php endif; ?>
                        </td>
                    <?php endforeach; ?>
                </tr>
            <?php endfor; ?>
        </tbody>
    </table>

</body>
</html>
