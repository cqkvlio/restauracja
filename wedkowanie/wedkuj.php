<!DOCTYPE html>
<html lang="pl">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./styl_1.css" />
    <title>Wędkowanie</title>
  </head>
  <body>
    <section class="baner">
      <h1>Portal dla wędkarzy</h1>
    </section>
    <section class="bloki">
      <section class="bloki-lewe">
        <section class="blok-lewy-1">
          <h3>Ryby zamieszkujące rzeki</h3>
          <ol>
            <?php
              include_once 'skrypt.php';
              $db = laczenie();
              skrypt1($db);
            ?>
          </ol>
        </section>
        <section class="blok-lewy-2">
          <h3>Ryby drapieżne naszych wód</h3>
          <table>
            <tr>
              <th>L.p.</th>
              <th>Gatunek</th>
              <th>Występowanie</th>
            </tr>
              <?php
                skrypt2($db);
                rozlacz($db);
              ?>
          </table>
        </section>
      </section>
      <section class="blok-prawy">
        <img src="./ryba1.jpg" alt="Sum" />
        <br />
        <a href="./kwerendy.txt">Pobierz kwerendy</a>
      </section>
    </section>
    <section class="stopka">
      <p>Stronę wykonał: 04260802637</p>
    </section>
  </body>
</html>
