<?php

include('config/db.php');           // Memasukkan file db.php yang berisi konfigurasi database
include('classes/DB.php');          // Memasukkan file DB.php yang berisi definisi kelas DB
include('classes/Klub.php');        // Memasukkan file Klub.php yang berisi definisi kelas Klub
include('classes/Posisi.php');      // Memasukkan file Posisi.php yang berisi definisi kelas Posisi
include('classes/Pemain.php');      // Memasukkan file Pemain.php yang berisi definisi kelas Pemain
include('classes/Template.php');    // Memasukkan file Template.php yang berisi definisi kelas Template

// Buat instance pemain
$listPemain = new Pemain($DB_HOST, $DB_USERNAME, $DB_PASSWORD, $DB_NAME);

// Buka koneksi
$listPemain->open();
// Tampilkan data pemain
$listPemain->getPemainJoin();

// Cari pemain
if (isset($_POST['btn-cari'])) {
    // Methode mencari data pemain
    $listPemain->searchPemain($_POST['cari']);
} else if (isset($_POST['btn-sort'])) {
    // Methode mengurutkan data pemain
    $listPemain->sortingPemain();
} else {
    // Method menampilkan data pemain
    $listPemain->getPemainJoin();
}

$data = null;

// Ambil data pemain
// Gabungkan dgn tag html
// Untuk di passing ke skin/template
while ($row = $listPemain->getResult()) {
    $data .=     " <div class='col-md-3'>
        <a href='detail.php?id=" . $row['pemain_id'] . "'>
            <div class='card p-2 py-3 text-center'>
                <div class='img mb-2'> 
                    <img src='assets/images/" . $row['pemain_foto'] . "' width='110' height='110' class='rounded-circle' alt='" . $row['pemain_foto'] . "' style='object-fit: cover;'>
                </div>
                <h5 class='mb-0'><strong> " . $row['pemain_nama'] . " </strong></h5><br>
                <small>" . $row['posisi_nama'] . "</small><br>
                <i>" . $row['klub_nama'] . "</i>
                <div class='mt-4 apointment'> <button class='btn btn-info btn-opacity-50 text-uppercase'>Detail</button> </div>
            </div>
        </a>
    </div> ";
}

// Tutup koneksi
$listPemain->close();

// Buat instance template
$home = new Template('templates/skin.html');

// Simpan data ke template
$home->replace('DATA_PEMAIN', $data);
$home->write();
