import tkinter
import cv2 
from PIL import Image, ImageTk
from datetime import datetime
import mysql.connector
import customtkinter
import time

#Set Up Tkinter
customtkinter.set_appearance_mode("dark")  
customtkinter.set_default_color_theme("blue")  

# Inisialisasi Window
app = customtkinter.CTk()
app.geometry('1920x1080')
app.title("Sistem Presensi Kelas V1 D4 Teknik Elektronika")

# Inisialisasi Kamera
vid = cv2.VideoCapture(0)

# Frame Utama
main_frame = customtkinter.CTkFrame(app)
main_frame.pack(fill="both", expand=True, padx=10, pady=10) 

# Header Ucapan Selamat Datang
header_frame = customtkinter.CTkFrame(main_frame, fg_color="transparent")
header_frame.pack(fill="x", pady=(0, 10))  #

title_label = customtkinter.CTkLabel(
    header_frame, 
    text="Selamat Datang! Silahkan Presensi", 
    font=customtkinter.CTkFont(size=24, weight="bold"), 
    anchor="center"  
)

title_label.pack(expand=True, pady=10)
 

# Frame konten
container_frame = customtkinter.CTkFrame(main_frame)
container_frame.pack(fill="both", expand=True, padx=10, pady=5)  

# Frame Kamera (kiri)
left_frame = customtkinter.CTkFrame(container_frame)
left_frame.pack(side="left", fill="both", padx=5, pady=5)  

camera_label = customtkinter.CTkLabel(
    left_frame, 
    text="Camera Preview", 
    font=customtkinter.CTkFont(size=14, weight="bold")
)
camera_label.pack(pady=2)  

# Canvas untuk Kamera
camera_frame = customtkinter.CTkFrame(left_frame, fg_color="transparent")
camera_frame.pack(pady=2) 

canvas = tkinter.Canvas(camera_frame, width=480, height=360, bg='black')
canvas.pack(padx=2, pady=2)  

# Frame kanan
right_container = customtkinter.CTkFrame(container_frame)
right_container.pack(side="left", fill="both", padx=5, pady=5, expand=True) 

# Frame hasil presensi
result_frame = customtkinter.CTkFrame(right_container)
result_frame.pack(fill="both", padx=5, pady=2, expand=False)  

result_title = customtkinter.CTkLabel(
    result_frame,
    text="Hasil Presensi",
    font=customtkinter.CTkFont(size=14, weight="bold")
)
result_title.pack(pady=2, padx=5, anchor="w")  

# Frame hasil foto absen
result_content_frame = customtkinter.CTkFrame(result_frame)
result_content_frame.pack(fill="both", padx=2, pady=2) 

# canvas untuk hasil foto absen
photo_frame = customtkinter.CTkFrame(result_content_frame)
photo_frame.pack(side="left", padx=2, pady=2)  

canvas1 = customtkinter.CTkCanvas(photo_frame, width=480, height=360)
canvas1.pack(padx=2, pady=2)  # Reduced padding

# Frame hitam untuk notif
details_frame = customtkinter.CTkFrame(result_content_frame)
details_frame.pack(side="left", fill="both", expand=True, padx=2, pady=2)  

# Inisialisasi Notif
notif1 = tkinter.StringVar()
notif2 = tkinter.StringVar()
notif3 = tkinter.StringVar()
notif4 = tkinter.StringVar()
notif5 = tkinter.StringVar()

# Label Notifikasi
for notif_var in [notif1, notif2, notif3, notif4, notif5]:
    label = customtkinter.CTkLabel(
        details_frame,
        textvariable=notif_var,
        font=customtkinter.CTkFont(size=12),
        justify="left",
        anchor="w"
    )
    label.pack(pady=1, padx=5, anchor="w")  

# Frame input
input_frame = customtkinter.CTkFrame(right_container)
input_frame.pack(fill="x", padx=5, pady=2)  

# Pilih mata kuliah
course_frame = customtkinter.CTkFrame(input_frame)
course_frame.pack(fill="x", padx=2, pady=2)  

mk_title = customtkinter.CTkLabel(
    course_frame,
    text="Pilih Mata Kuliah",
    font=customtkinter.CTkFont(size=14, weight="bold")
)
mk_title.pack(pady=(2, 1), padx=5, anchor="w")  

combobox_var = customtkinter.StringVar(value="Pilih Mata Kuliah")  
combobox = customtkinter.CTkComboBox(
    master=course_frame,
    values=["P.Pemrograman Komputer","Sistem Kendali", 
            "P.Sistem Kendali", "P.Mikroprosessor", "Instrumentasi", "Elektronika Daya","B.Inggris Komunikasi", "K3LH"],
    state="normal",
    variable=combobox_var,
    width=250,
    height=32,
    font=customtkinter.CTkFont(size=12)
)
combobox.pack(pady=2, padx=5, anchor="w")  

# Frame Input NIM
nim_frame = customtkinter.CTkFrame(input_frame)
nim_frame.pack(fill="x", padx=2, pady=2)  

input_title = customtkinter.CTkLabel(
    nim_frame,
    text="Input NIM",
    font=customtkinter.CTkFont(size=14, weight="bold")
)
input_title.pack(pady=(2, 1), padx=5, anchor="w")  

# Kolom mengisi NIM
entry = customtkinter.CTkEntry(
    nim_frame,
    placeholder_text="Masukkan NIM Anda",
    width=250,
    height=32,
    font=customtkinter.CTkFont(size=12)
)
entry.pack(pady=2, padx=5, anchor="w")

# TOmbol Presensi
presensi_button = customtkinter.CTkButton(
    nim_frame,
    text="Presensi",
    width=250,
    height=32,
    font=customtkinter.CTkFont(size=14, weight="bold"),
    command=lambda: process(),
    fg_color="#1DA1F2",
    hover_color="#1877F2"
)
presensi_button.pack(pady=2, padx=5, anchor="w") 

# FUngsi proses komunikasi dengan database
def process():
    nim = entry.get()
    selected_course = combobox_var.get()
    current_datetime = datetime.now()
    current_time = current_datetime.strftime("%H:%M:%S")
    current_date = current_datetime.strftime("%Y-%m-%d")
    current_day = current_datetime.strftime("%A")

    if nim.isnumeric() and selected_course != "Pilih Mata Kuliah":
        config = {
            'user': 'root',
            'password': '',
            'host': '127.0.0.1',
            'database': 'db_presensi',
            'raise_on_warnings': True
        }

        try:
            cnx = mysql.connector.connect(**config)
            cursor = cnx.cursor()

            # 1. Cek keberadaan NIM
            cursor.execute("SELECT * FROM tb_member WHERE id_nim = " + nim)
            rows = cursor.fetchall()

            if len(rows) == 0:
                notif1.set('❌ Data NIM tidak ditemukan')
                return

            # 2. Cek jadwal kuliah
            cursor.execute("SELECT waktu_mulai FROM tb_jadwal WHERE mata_kuliah = %s", (selected_course,))
            schedule = cursor.fetchone()
            scheduled_time = schedule[0]
            
            # 3. Bandingkan waktu
            current_time_obj = datetime.strptime(current_time, "%H:%M:%S")
            scheduled_time_obj = datetime.strptime(scheduled_time, "%H:%M:%S")

            # 4. Ambil gambar
            _, image = vid.read()
            formatted_datetime = current_datetime.strftime("%Y%m%d%H%M%S")
            name_file = f"file_{formatted_datetime}.png"
            cv2.imwrite(name_file, image)

            # 5. Simpan ke database
            sql = """INSERT INTO tb_presensi 
                    (id_user, hari_kedatangan, tanggal_kedatangan, 
                     waktu_kedatangan, mata_kuliah, image) 
                    VALUES (%s, %s, %s, %s, %s, %s)"""
            val = (nim, current_day, current_date, current_time, 
                  selected_course, name_file)
            cursor.execute(sql, val)
            cnx.commit()

            # 6. Update notifikasi
            if current_time_obj <= scheduled_time_obj:
                status = "✅ Anda hadir tepat waktu!"
            elif current_time_obj > scheduled_time_obj:
                status = "❌ Anda terlambat!"

            notif1.set(status)
            notif2.set(f"👤 Nama: {rows[0][1]}")
            notif3.set(f"🆔 NIM: {rows[0][0]}")
            notif4.set(f"⏰ Jam Kedatangan: {current_time} (Jadwal: {scheduled_time})")
            notif5.set(f"📚 Mata Kuliah: {selected_course}")

            # 7. Tampilkan gambar
            img = Image.open(name_file)
            resized_image = img.resize((480, 360))
            image_ = ImageTk.PhotoImage(resized_image)
            canvas1.create_image(240, 180, image=image_, anchor=tkinter.CENTER)
            canvas1.image = image_

        # Debugging jika ada kesalahan 
        except mysql.connector.Error as err:
            notif1.set(f"❌ Error database: {err}")
        except Exception as e:
            notif1.set(f"❌ Error: {str(e)}")
        finally:
            if 'cursor' in locals():
                cursor.close()
            if 'cnx' in locals() and cnx.is_connected():
                cnx.close()
        # Jika tidak memasukan NIM atau tidak memilih mata kuliah 
    else:
        if not nim.isnumeric():
            notif1.set('❌ Masukkan NIM yang benar!')
        if selected_course == "Pilih Mata Kuliah":
            notif1.set('❌ Pilih mata kuliah terlebih dahulu!')   
                    
# Fungsi membuka kamera
def open_camera():
    _, frame = vid.read()
    if frame is not None:
        frame = cv2.resize(frame, (480, 360))
        opencv_image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGBA)
        captured_image = Image.fromarray(opencv_image)
        photo_image = ImageTk.PhotoImage(image=captured_image)
        canvas.create_image(240, 180, image=photo_image, anchor=tkinter.CENTER)
        canvas.image = photo_image
    app.after(10, open_camera)

# Tabel Jam
clock_label = customtkinter.CTkLabel(
    left_frame,
    text="",
    font=customtkinter.CTkFont(size=24, weight="bold"),

)
clock_label.pack(side="bottom", pady=10)  # Adjusted to appear below the camera

# Fungsi Jam update
def update_clock():
    current_time = time.strftime("%H:%M:%S")
    current_date = time.strftime("%d-%m-%Y")
    clock_label.configure(text=f"{current_date} {current_time}")
    app.after(1000, update_clock)

# text tambahan
status_frame = customtkinter.CTkFrame(main_frame, height=30)
status_frame.pack(fill="x", side="bottom", padx=10)  

status_label = customtkinter.CTkLabel(
    status_frame,
    text="© 2024 Presensi Mahasiswa",
    font=customtkinter.CTkFont(size=12)
)
status_label.pack(side="left", padx=10)

# Start clock
update_clock()

# Start camera
open_camera()

# Start main loop
app.mainloop()