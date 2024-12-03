** PENJELASAN CARA PENGGUNAAN (HARAP DIPERHTAIKAN) **
Program ini menggunakan bahasa python dengan didukung beberapa library: (harap install library)
 1.CV2
 2.tkinter
 3.datetime
 4.mysql
 5.customtkinter
 6.time
Program ini menerapkan XAMPP (mysql) yang digunakan sebagai tempat penyimpanan untuk database sistem absensi mahasiswa sehingga mahasiswa dapat diidentifikasi
Pada Database, buatlah db dengan nama db_presensi
Dalam db_presensi buatlah beberapa tabel yang diberikan nama-nama berikut yang diikuti dengan elemen-elemenya yaitu:
 
 1.tb_jadwal
 ^mata_kuliah
 ^hari
 ^waktu_mulai
 ^waktu_selesai
 
 2.tb_member
 ^id_nim
 ^nama_mahasiswa
 ^Rombel
 ^tanggal_lahir
 
 3.tb_presensi
 ^id_user
 ^hari_kedatangan
 ^tanggal_kedatangan
 ^waktu_kedatangan
 ^image
 ^mata_kuliah
 
Atur semua sebagai TEXT
Jangan lupa untuk mengisi data mahasiswa dan data jadwal mata kuliah pada sistem absen

NOTE:Pada sistem absensin ini masih belum bisa mendeteksi wajah apakah mahasiswa tersebut merupakan si A?hanya baru bisa mengindentifikasi melalui NIM input kemudian mengambil foto user.
 
