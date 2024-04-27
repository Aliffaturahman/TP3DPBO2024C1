<?php

class Pemain extends DB{
    // Mendapatkan data pemain dengan melakukan join antara tabel pemain, klub, dan posisi. Data diurutkan berdasarkan pemain_id
    function getPemainJoin(){
        $query = "SELECT * FROM pemain JOIN klub ON pemain.klub_id=klub.klub_id JOIN posisi ON pemain.posisi_id=posisi.posisi_id ORDER BY pemain.pemain_id";
        return $this->execute($query);
    }

    // Mendapatkan semua data pemain dari tabel pemain
    function getPemain(){
        $query = "SELECT * FROM pemain";
        return $this->execute($query);
    }

    // Mendapatkan data pemain berdasarkan pemain_id dengan melakukan join antara tabel pemain, klub, dan posisi
    function getPemainById($id){
        $query = "SELECT * FROM pemain JOIN klub ON pemain.klub_id=klub.klub_id JOIN posisi ON pemain.posisi_id=posisi.posisi_id WHERE pemain_id=$id";
        return $this->execute($query);
    }

    // Mencari data pemain berdasarkan kata kunci yang cocok dengan nama pemain, nama klub, atau nama posisi. Data diurutkan berdasarkan pemain_id
    function searchPemain($keyword){
        $query = "SELECT * FROM pemain JOIN klub ON pemain.klub_id=klub.klub_id JOIN posisi ON pemain.posisi_id=posisi.posisi_id WHERE pemain_nama LIKE '%$keyword%' OR klub_nama LIKE '%$keyword%' OR posisi_nama LIKE '%$keyword%' ORDER BY pemain.pemain_id;";
        return $this->execute($query);
    }

    // Mendapatkan data pemain dengan melakukan join antara tabel pemain, klub, dan posisi. Data diurutkan berdasarkan pemain_nama secara ascending (A-Z)
    function sortingPemain(){
        $query = "SELECT * FROM pemain JOIN klub ON pemain.klub_id=klub.klub_id JOIN posisi ON pemain.posisi_id=posisi.posisi_id ORDER BY pemain.pemain_nama ASC";
        return $this->execute($query);
    }

    // Menambahkan data pemain baru ke dalam tabel pemain dengan menggunakan nilai-nilai yang diberikan sebagai parameter
    function addData($data, $file){
        $nama = $data['nama'];
        $foto = $file['foto']['name'];
        $temp_foto = $file['foto']['tmp_name'];
        move_uploaded_file($temp_foto, 'assets/images/' . $foto);
        $no_punggung = $data['no_punggung'];
        $tinggi = $data['tinggi'];
        $usia = $data['usia'];
        $klub = $data['klub'];
        $posisi = $data['posisi'];
        $negara = $data['negara'];

        $query = "INSERT INTO pemain VALUES('', '$foto', '$nama', '$no_punggung', '$tinggi', '$usia', '$klub', '$posisi', '$negara');";
        return $this->executeAffected($query);
    }

    // Memperbarui data pemain berdasarkan pemain_id dengan menggunakan nilai-nilai yang diberikan sebagai parameter
    function updateData($id, $data, $file){
        $nama = $data['nama'];
        $foto = $file['foto']['name'];
        $temp_foto = $file['foto']['tmp_name'];
        move_uploaded_file($temp_foto, 'assets/images/' . $foto);
        $no_punggung = $data['no_punggung'];
        $tinggi = $data['tinggi'];
        $usia = $data['usia'];
        $klub = $data['klub'];
        $posisi = $data['posisi'];
        $negara = $data['negara'];

        $query = "UPDATE pemain SET pemain_foto='$foto', pemain_nama='$nama', pemain_no_punggung='$no_punggung', pemain_tinggi='$tinggi', pemain_usia='$usia', klub_id='$klub', posisi_id='$posisi', pemain_negara='$negara' where pemain_id=$id ";
        return $this->executeAffected($query);
    }

    // Menghapus data pemain dari tabel pemain berdasarkan pemain_id yang diberikan sebagai parameter
    function deleteData($id){
        $query = "DELETE from pemain where pemain_id=$id";
        return $this->executeAffected($query);
    }
}
