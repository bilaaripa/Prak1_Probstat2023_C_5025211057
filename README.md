# Prak1_Probstat2023_C_5025211057

| Identitas    |                         |
| -------------| ------------------------|                                     
| Nama         | Salsabila Fatma Aripa   |
| NRP          | 5025211057              |
| Kelas        | Probstat (C)            |

- [Soal1](README.md###Soal1)
- [Soal2](README.md###Soal2)
- [Soal3](README.md###Soal3)
- [Soal4](README.md###Soal4)
- [Soal5](README.md###Soal5)

### Soal 1
> Probabilitas seorang bayi yang baru lahir berjenis kelamin laki-laki adalah 0,488. 
Jika kita asumsikan bahwa dalam satu hari di rumah sakit terdapat 10 kelahiran, 
maka:
 
a. Bagaimana pendistribusian banyak bayi laki-laki? Tentukan distribusi dengan 
parameter yang sesuai.
- Penyelesaian : Distribusi yang sesuai yakni Distribusi Binomial. Diketahui n adalah jumlah percobaan sebanyak 10 dan p adalah probabilitas keberhasilannya adalah 0,44. Dalam penyelesaian soal ini digunakan fungsi `dbinom`. Fungsi dbinom adalah fungsi bawaan R untuk menghitung distribusi binomial. Hasil outputnya akan berupa vektor yang menunjukkan probabilitas masing-masing nilai dalam daftar k.
```r
#Distribusi yang sesuai yakni distribusi binomial dengan n=10 dan p=0,488
n <- 10
p <- 0.488
k <- 0:10
dbinom(k, n, p)
```
![1a](https://user-images.githubusercontent.com/114417418/236018916-a79b1a22-7b55-4861-9cc9-5b88eca4dfac.png)

b. Berapa probabilitas bahwa tepat tiga bayi di antaranya berjenis kelamin laki - laki?
- Penyelesaiian : Menggunakan fungsi `dbinom` yang akan menghitung probabilitas mendapatkan tepat 3 bayi laki-laki dari 10 kelahiran dengan probabilitas keberhasilan 0.488. `prob_tepat_tiga` adalah nama variabel yang akan menampung hasil probabilitas dari fungsi distribusi binomial tersebut.
```r
prob_tepat_tiga <- dbinom(3, n, p)
prob_tepat_tiga
```
![1b](https://user-images.githubusercontent.com/114417418/236019165-c368d815-37e0-4387-bc71-c7a66e49111d.png)

c. Berapa probabilitas bahwa kurang dari tiga bayi di antaranya berjenis kelamin 
laki-laki?
- Penyelesaian : Menggunakan fungsi `pbinom`. Fungsi pbinom adalah fungsi distribusi binomial kumulatif yang akan fungsi distribusi binomial kumulatif yang akan menghitung probabilitas mendapatkan kurang dari atau sama dengan 2 bayi laki-laki dari 10 kelahiran dengan probabilitas keberhasilan 0.488. `prob_kurang_tiga` adalah nama variabel yang akan menampung hasil probabilitas dari fungsi distribusi binomial kumulatif tersebut.
```r
prob_kurang_tiga <- pbinom(2, n, p)
prob_kurang_tiga
```
![1c](https://user-images.githubusercontent.com/114417418/236019193-9abd8d8d-1a2e-493e-80e4-f09b9731950a.png)

d. Berapa probabilitas bahwa tiga atau lebih bayi di antaranya berjenis kelamin 
laki-laki?
- Penyelesaian : Menggunakan rumus `1 - pbinom(2, n, p)`. Rumus tersebut adalah rumus yang menghitung probabilitas mendapatkan lebih dari 2 bayi laki-laki dari 10 kelahiran dengan probabilitas keberhasilan 0.488. Dalam rumus ini, 1 menunjukkan probabilitas komplementer atau probabilitas kejadian yang saling melengkapi dari kejadian yang ingin dicari, yaitu kejadian mendapatkan lebih dari 2 bayi laki-laki, sedangkan pbinom(2, n, p) adalah probabilitas kejadian kurang dari atau sama dengan 2 bayi laki-laki. `prob_tiga_atas` adalah nama variabel yang akan menampung hasil probabilitas dari rumus tersebut.
```r
prob_tiga_atas <- 1 - pbinom(2, n, p)
prob_tiga_atas
```
![1d](https://user-images.githubusercontent.com/114417418/236019216-c7656e3d-814f-4d20-9981-52ca4ea1cec8.png)

e. Berapa nilai harapan dan simpangan baku banyak bayi laki-laki?
- Penyelesaiaan : Menggunakan rumus `mean_laki_laki <- n * p`. Rumus tersebut adalah rumus untuk menghitung rata-rata (mean) dari distribusi binomial, yang dihitung dengan mengalikan nilai n dengan nilai probabilitas keberhasilan p. Hasil perhitungan disimpan dalam variabel mean_laki_laki. Selain itu digunakan rumus `sd_laki_laki <- sqrt(n * p * (1 - p))`. Rumus tersebut adalah rumus untuk menghitung standar deviasi (standard deviation) dari distribusi binomial, yang dihitung dengan mengalikan akar kuadrat dari hasil perkalian antara n, p, dan (1-p). Hasil perhitungan disimpan dalam variabel sd_laki_laki
```r
mean_laki_laki <- n * p
sd_laki_laki <- sqrt(n * p * (1 - p))
mean_laki_laki
sd_laki_laki
```
![1e](https://user-images.githubusercontent.com/114417418/236019233-f919ee6d-35a6-4460-a540-8199a4335db4.png)

f. Gambarkan histogram pendistribusian banyak bayi laki-laki.
- Penyelesaian : 
- Digunakan kode R untuk menghasilkan sampel acak dari distribusi binomial dengan parameter n dan p, dan menampilkan histogram dari sampel tersebut.
- Fungsi `set.seed()` digunakan untuk menetapkan nilai awal untuk generator bilangan acak di dalam R, sehingga dengan nilai seed yang sama, pengguna akan mendapatkan hasil yang sama setiap kali kode tersebut dijalankan.
- Variabel n dan p harus ditetapkan sebelumnya untuk menentukan parameter distribusi binomial yang ingin dihasilkan. Dalam hal ini, kita menghasilkan 1000 sampel acak dengan parameter n dan p yang sudah ditentukan sebelumnya, dan menyimpannya dalam variabel bayi_laki.
- Fungsi `rbinom()` digunakan untuk menghasilkan sampel acak dari distribusi binomial dengan parameter n dan p yang ditentukan.
- Fungsi `hist()` digunakan untuk memvisualisasikan distribusi sampel acak yang dihasilkan dalam bentuk histogram. Parameter breaks digunakan untuk menentukan interval batas pada sumbu x, sedangkan parameter main dan xlab digunakan untuk memberikan judul dan label sumbu pada grafik histogram tersebut.
```r
set.seed(123)
bayi_laki <- rbinom(1000, n, p)
hist(bayi_laki, breaks=seq(-0.5, n+0.5, 1), main="Histogram Banyak Bayi Laki-laki", xlab="Jumlah Bayi Laki-laki", ylab="Frekuensi")
```
![1f](https://user-images.githubusercontent.com/114417418/236019252-6067b5be-e0f0-4b44-8018-0959036ca32d.png)

##### Halaman Kerja Nomor 1
![image](https://user-images.githubusercontent.com/114417418/236024827-b7be9ce1-855e-49ba-9782-b3ab1f7d3279.png)

### Soal 2
> Misalkan banyak kematian karena kanker tulang untuk seluruh pekerja di pabrik 
ban dalam 20 tahun ke depan adalah 1,8.

a. Bagaimana pendistribusian banyak kematian karena kanker tulang? Tentukan 
distribusi dengan parameter yang sesuai.
- Penyelesaian : Distribusi yang sesuai yakni Distribusi Poisson. Diketahui lamda `λ = 1,8`. Menggunakan fungsi dpois. `dpois(x, lambda)` adalah kode yang menghitung probabilitas distribusi Poisson dengan parameter lambda pada titik x. Dalam kasus ini, nilai x adalah 0 sehingga probabilitas yang dihitung adalah probabilitas mendapatkan 0 kejadian dalam distribusi Poisson dengan parameter lambda yang diberikan.
```r
x <- 0
lambda <- 1.8
dpois(x, lambda)
```
![2a](https://user-images.githubusercontent.com/114417418/236019727-11f8815a-7f22-47e2-af2a-ecbdb7300b1a.png)

b. Ada 4 kematian akibat kanker tulang yang dilaporkan di kalangan pekerja 
pabrik ban, apakah itu peristiwa yang tidak biasa? Hitung probabilitas 
berdasarkan distribusi yang telah dipilih.
- Penyelesaian : Digunakan beberapa kode sebagai berikut. `k <- 4` adalah kode yang menginisialisasi variabel k dengan nilai 4. `prob <- dpois(k, lambda)` adalah kode yang menghitung probabilitas distribusi Poisson pada titik k dengan parameter lambda dan hasilnya disimpan dalam variabel prob. Dalam kasus ini, nilai k adalah 4 dan lambda adalah variabel yang sudah diinisialisasi sebelumnya dengan nilai 1.8.
```r
k <- 4
prob <- dpois(k, lambda)
prob
```
![2b](https://user-images.githubusercontent.com/114417418/236019757-7a995e3e-a395-41cb-ac56-48bdeeb7338b.png)

c. Berapa peluang paling banyak 4 kematian akibat kanker tulang?
- Penyelesaian : Digunakan beberapa kode sebagai berikut. `k_max <- 4` adalah kode yang menginisialisasi variabel k_max dengan nilai 4. `prob_max <- ppois(k_max, lambda)` adalah kode yang menghitung probabilitas distribusi Poisson dari 0 hingga k_max dengan parameter lambda dan hasilnya disimpan dalam variabel prob_max. Dalam kasus ini, nilai k_max adalah 4 dan lambda adalah variabel yang sudah diinisialisasi sebelumnya dengan nilai 1.8.
```r
k_max <- 4
prob_max <- ppois(k_max, lambda)
prob_max
```
![2c](https://user-images.githubusercontent.com/114417418/236019776-60a269dd-eb52-4906-abc3-ba5af4a92389.png)

d. Berapa peluang lebih dari 4 kematian akibat kanker tulang?
- Penyelesaian : Karena kita telah menghitung probabilitas untuk mendapatkan 0, 1, 2, 3, atau 4 kejadian dalam distribusi Poisson dengan prob_max, maka probabilitas untuk mendapatkan lebih dari 4 kejadian dapat dihitung dengan mengurangi 1 dengan prob_max, yaitu `prob_more_than_4 <- 1 - prob_max`.
```r
prob_more_than_4 <- 1 - prob_max
prob_more_than_4
```
![2d](https://user-images.githubusercontent.com/114417418/236019798-3e9a82b3-3bd3-49ff-a84f-d047230a8cf5.png)

e. Berdasarkan distribusi yang telah dipilih, berapakah nilai harapan dan standar 
deviasi banyak kematian akibat kanker tulang untuk pekerja pabrik ban?
- Penyelesaian : Digunakan Kode `mean <- lambda`  untuk menghitung nilai rata-rata atau mean dari distribusi Poisson dengan parameter lambda. Dalam hal ini, lambda memiliki nilai 1.8. Sedangkan kode sd <- sqrt(lambda) digunakan untuk menghitung standar deviasi atau standard deviation dari distribusi Poisson dengan parameter lambda. Standar deviasi mengukur seberapa jauh data tersebar dari nilai rata-rata. Dalam hal ini, nilai lambda adalah 1.8.
```r
mean <- lambda
sd <- sqrt(lambda)
mean
sd
```
![2e](https://user-images.githubusercontent.com/114417418/236019831-25fd4634-1153-410b-8025-3f9c2ae24a28.png)

f. Gambarkan histogram pendistribusian banyak banyak kematian akibat kanker 
tulang untuk pekerja pabrik ban.
- Penyelesaian :
- Digunakan kode R untuk menghasilkan sampel acak dari distribusi Poisson dengan parameter lambda dan menampilkan histogram dari sampel tersebut.
- Fungsi `set.seed()` digunakan untuk menetapkan nilai awal untuk generator bilangan acak di dalam R, sehingga dengan nilai seed yang sama, pengguna akan mendapatkan hasil yang sama setiap kali kode tersebut dijalankan.
- Variabel n harus ditetapkan sebelumnya untuk menentukan jumlah sampel yang ingin dihasilkan.
- Fungsi `rpois()` adalah fungsi yang digunakan untuk menghasilkan sampel acak dari distribusi Poisson dengan parameter lambda yang ditentukan. Dalam hal ini, sampel acak sebanyak n dengan parameter lambda akan dihasilkan dan disimpan dalam variabel samples.
- Fungsi `hist()` digunakan untuk memvisualisasikan distribusi sampel acak yang dihasilkan dalam bentuk histogram. Parameter breaks digunakan untuk menentukan interval batas pada sumbu x, sedangkan parameter main dan xlab digunakan untuk memberikan judul dan label sumbu pada grafik histogram tersebut.
```r
n <- 1000
set.seed(123)
samples <- rpois(n, lambda)
hist(samples, breaks = seq(-0.5, max(samples) + 0.5, 1), main = "Histogram of Bone Cancer Deaths", xlab = "Number of Deaths")
```
![2f](https://user-images.githubusercontent.com/114417418/236019852-37e5830d-0724-4ca5-91d2-b8a771398b90.png)

g. Gunakan simulasi untuk memeriksa hasil sebelumnya.
- Penyelesaian : Pertama, dilakukan pengaturan set.seed(123) yang digunakan untuk menghasilkan angka acak yang konsisten dan dapat direplikasi oleh orang lain. Selanjutnya, dalam setiap simulasi, terdapat perintah `rpois(1, lambda`), yang berarti menghasilkan satu angka acak dari distribusi Poisson dengan parameter lambda. Kemudian, hasil dari seluruh simulasi dikumpulkan dengan menggunakan fungsi `replicate()`, dan dihitung total jumlah nilai acak yang dihasilkan dengan `sum()`.
```r
n_sim <- 1000
set.seed(123)
replicate(n_sim, {
  sum(rpois(1, lambda))
})
```
![2g](https://user-images.githubusercontent.com/114417418/236019875-ef63b44b-b0d0-4edb-bfcc-fc98393fe758.png)

h. Jelaskan banyak kematian akibat kanker tulang berdasarkan simulasi Anda. 
Bandingkan jawaban pada pertanyaan 2d dengan hasil simulasi Anda.

- Simulasi menunjukkan bahwa banyak kematian akibat kanker tulang dapat bervariasi secara signifikan dari satu sampel ke sampel lainnya, tetapi sebagian besar simulasi menghasilkan jumlah kematian yang lebih dari 4, yang sesuai dengan hasil analisis probabilitas sebelumnya. Kedua metode ini mengindikasikan kemungkinan besar akan ada lebih dari 4 kematian akibat kanker tulang di pabrik ban dalam 20 tahun ke depan.


##### Halaman Kerja Nomor 2
![image](https://user-images.githubusercontent.com/114417418/236025262-1f04d52e-7abb-4276-88e7-e7b0a3c254da.png)

### Soal 3
> Diketahui nilai x = 3 dan v = 10. Tentukan:
a. Fungsi probabilitas dari distribusi Chi-Square.
- Penyelesaian : 
- Digunakan kode R yang mengassign nilai 3 ke variabel x dan nilai 10 ke variabel v. Kemudian, kode tersebut menggunakan fungsi `dchisq()` yang merupakan fungsi probabilitas untuk distribusi chi-square untuk menghitung probabilitas untuk nilai x (yaitu 3) pada distribusi chi-square dengan derajat kebebasan v (yaitu 10). 
- Probabilitas ini disimpan di dalam variabel `prob_chisq`. Dalam hal ini, karena fungsi dchisq() mengembalikan probabilitas dari nilai x pada distribusi chi-square dengan derajat kebebasan v, maka prob_chisq akan berisi nilai probabilitas tersebut. Nilai ini akan bergantung pada nilai x dan v yang diberikan ke dalam fungsi.
```r
x <- 3
v <- 10
prob_chisq <- dchisq(x, df = v)
prob_chisq
```
![3a](https://user-images.githubusercontent.com/114417418/236020468-2d9acc88-3fa2-452d-ac97-bcfbcf041724.png)
b. Histogram dari distribusi Chi-Square dengan 500 data acak.
- Penyelesaian : 
- Digunakan kode R untuk menghasilkan 500 sampel acak dari distribusi chi-square dengan derajat kebebasan v yang disimpan di dalam variabel data_chisq. Fungsi `set.seed()` digunakan untuk menetapkan nilai awal untuk generator bilangan acak di dalam R, sehingga dengan nilai seed yang sama, pengguna akan mendapatkan hasil yang sama setiap kali kode tersebut dijalankan. 
- Fungsi `rchisq()` adalah fungsi yang digunakan untuk menghasilkan bilangan acak dari distribusi chi-square dengan derajat kebebasan yang ditentukan. Dalam hal ini, kita menghasilkan 500 bilangan acak dari distribusi chi-square dengan derajat kebebasan yang sudah ditentukan sebelumnya pada variabel v. 
- Setelah itu, kita memvisualisasikan distribusi data_chisq dalam bentuk histogram dengan menggunakan fungsi `hist()`. Parameter main, xlab, dan ylab digunakan untuk memberikan judul dan label sumbu pada grafik histogram tersebut. 
```r
set.seed(123)
data_chisq <- rchisq(n = 500, df = v)
hist(data_chisq, main = "Histogram Distribusi Chi-Square", xlab = "Nilai", ylab = "Frekuensi")
```
![3b](https://user-images.githubusercontent.com/114417418/236020486-dcb095dd-070e-4d87-92f2-4d0422f6f532.png)

c. Nilai rataan (μ) dan varian (σ²) dari distribusi Chi-Square.
- Penyelesaian : 
- Digunakan kode R untuk menghitung rata-rata dan variansi dari 100.000 sampel acak dari distribusi chi-square dengan derajat kebebasan k yang disimpan di dalam variabel `mean_chisq` dan `var_chisq`, masing-masing. 
- Fungsi `set.seed()` digunakan untuk menetapkan nilai awal untuk generator bilangan acak di dalam R, sehingga dengan nilai seed yang sama, pengguna akan mendapatkan hasil yang sama setiap kali kode tersebut dijalankan. Variabel k ditetapkan untuk menyimpan nilai derajat kebebasan yang akan digunakan untuk distribusi chi-square. 
- Fungsi `rchisq()` digunakan untuk menghasilkan bilangan acak dari distribusi chi-square dengan derajat kebebasan yang ditentukan. Dalam hal ini, kita menghasilkan 100.000 bilangan acak dari distribusi chi-square dengan derajat kebebasan yang sudah ditentukan sebelumnya pada variabel k. 
- Fungsi mean() dan var() digunakan untuk menghitung rata-rata dan variansi dari sampel acak yang dihasilkan oleh fungsi rchisq(). 
- Setelah kode tersebut dijalankan, nilai rata-rata dan variansi dari 100.000 sampel acak distribusi chi-square dengan derajat kebebasan k akan disimpan dalam variabel mean_chisq dan var_chisq, masing-masing.
```r
set.seed(123)
k <- 10
mean_chisq <- mean(rchisq(n = 100000, df = k))
var_chisq <- var(rchisq(n = 100000, df = k))
mean_chisq
var_chisq
```
![3c](https://user-images.githubusercontent.com/114417418/236020508-64324be9-9853-4ea6-9b8b-ef955937491c.png)

##### Halaman Kerja Nomor 3
![image](https://user-images.githubusercontent.com/114417418/236025544-c6d7570d-3c23-48da-bd52-88a9d2d4f582.png)

### Soal 4
> Diketahui data bangkitan acak sebanyak 100 dengan mean = 45 dan sd = 5. 
Tentukan:

a. Fungsi probabilitas dari distribusi Normal `P(X1 ≤ x ≤ X2)`, hitung z-scorenya 
dan plot data bangkitan acaknya dalam bentuk grafik. Petunjuk (gunakan
fungsi plot()).
Keterangan:
X1 = Bilangan bulat terdekat di bawah rata-rata
X2 = Bilangan bulat terdekat di atas rata-rata
Contoh data:
11
1,2,4,2,6,3,10,11,5,3,6,8
rata-rata = 5.083333
X1 = 5
X2 = 6
```r
set.seed(123)
data <- rnorm(100, mean = 45, sd = 5)
# X1 dan X2
x1 <- floor(mean(data))
x2 <- ceiling(mean(data))
x1
x2
# Z-score
z1 <- (x1 - 45) / 5
z2 <- (x2 - 45) / 5
z1
z2
# Probabilitas
p <- pnorm(z2) - pnorm(z1)
p

# Plot data
plot(density(data), main = "Grafik Data Bangkitan Acak", xlab = "Nilai", ylab = "Density")
abline(v = x1, col = "blue")
abline(v = x2, col = "green")
text(x = x1, y = 0.03, labels = "X1", pos = 1, col = "blue")
text(x = x2, y = 0.03, labels = "X2", pos = 3, col = "green")

```
![4a](https://user-images.githubusercontent.com/114417418/236020527-6ba83828-e5b6-48e4-96e6-60509367f9d4.png)

b. Gambarkan histogram dari distribusi Normal dengan breaks 50
- Penyelesaian : 
- Digunakan kode R untuk memvisualisasikan distribusi data dalam bentuk histogram.
- Fungsi `set.seed()` digunakan untuk menetapkan nilai awal untuk generator bilangan acak di dalam R, sehingga dengan nilai seed yang sama, pengguna akan mendapatkan hasil yang sama setiap kali kode tersebut dijalankan.
- Variabel data harus ditetapkan sebelumnya dan berisi data yang ingin divisualisasikan dalam bentuk histogram.
- Fungsi `hist()` digunakan untuk memvisualisasikan distribusi data dalam bentuk histogram. Parameter breaks digunakan untuk menentukan jumlah interval pada sumbu x, sedangkan parameter col digunakan untuk menentukan warna histogram dan parameter main dan xlab digunakan untuk memberikan judul dan label sumbu pada grafik histogram tersebut.
- Dalam hal ini, fungsi `hist()` akan menghasilkan histogram dari data yang sudah ditentukan sebelumnya dengan 50 interval pada sumbu x dan dengan warna hijau. Judul histogram adalah "Histogram Distribusi Normal" dan label sumbu x adalah "Nilai".
```r
set.seed(123)
hist(data, breaks = 50, col = "green", main = "Histogram Distribusi Normal", xlab = "Nilai")
```
![4b](https://user-images.githubusercontent.com/114417418/236020557-d3f29ea2-aee4-4651-b9ab-1313f903eb3b.png)

c. Nilai varian (σ²) dari hasil data bangkitan acak distribusi Normal.
- Peyelesaian : Fungsi `var()` digunakan untuk menghitung variansi dari data yang sudah ditentukan yakni `data <- rnorm(100, mean = 45, sd = 5)`. Hasil perhitungan variansi akan disimpan dalam variabel baru dengan nama varian. Variansi adalah sebuah ukuran untuk mengukur seberapa jauh data tersebar dari rata-rata atau nilai tengahnya. Semakin besar variansi, semakin besar keragaman data. Sedangkan semakin kecil variansi, semakin sedikit keragaman data.
```r
varian <- var(data)
```
![4c](https://user-images.githubusercontent.com/114417418/236020579-6156f990-0bfc-4fd8-a95b-1de16d5420d6.png)

##### Halaman Kerja Nomor 4
![image](https://user-images.githubusercontent.com/114417418/236025816-99c0b7e5-f247-4e6b-9210-ed43570683ef.png)

### Soal 5
> Kerjakanlah menggunakan distribusi T-Student.

a. Berapa probabilitas terjadinya suatu peristiwa acak X kurang dari -2,34 dengan 
- Penyelesaian : Pada distribusi t, derajat kebebasan menentukan bentuk distribusi, sedangkan nilai t-score menentukan posisi di dalam distribusi tersebut. Dalam kode ini, fungsi `pt()` digunakan untuk menghitung probabilitas terjadinya suatu peristiwa acak X yang memiliki t-score kurang dari -2,34 pada distribusi t dengan 6 derajat kebebasan.
6 derajat kebebasan?
```r
prob_a <- pt(-2.34, df=6)
prob_a
```
![5a](https://user-images.githubusercontent.com/114417418/236021056-9725987d-a857-48a0-bfc3-566acb2947ba.png)

b. Berapa probabilitas terjadinya suatu peristiwa acak X lebih dari 1,34 dengan 6 
derajat kebebasan?
- Penyelesaian : Pada kasus ini, `prob_b` merupakan probabilitas bahwa suatu peristiwa acak X memiliki nilai lebih besar dari 1.34 dengan 6 derajat kebebasan. Karena kita ingin mengetahui nilai probabilitas di atas 1.34, maka kita perlu mencari luasan di bawah kurva distribusi t-student mulai dari 1.34 ke arah positif tak terbatas. Dalam hal ini, kita menggunakan fungsi `pt()` dengan argumen -1.34 dan df=6 untuk mencari luasan di bawah kurva dari -∞ hingga -1.34, dan mengurangi nilai tersebut dari 1 untuk mendapatkan luasan di atas 1.34. Sehingga, probabilitas terjadinya suatu peristiwa acak X lebih dari 1.34 dengan 6 derajat kebebasan adalah prob_b.
```r
prob_b <- 1 - pt(1.34, df=6)
prob_b
```
![5b](https://user-images.githubusercontent.com/114417418/236021082-3d1840dc-0c40-4af8-9926-d2160de0c340.png)

c. Berapa probabilitas terjadinya suatu peristiwa acak X kurang dari -1,23 atau 
lebih besar dari 1,23 dengan 3 derajat kebebasan?
- Penyelesaian : Pertama, kita dapat mencari probabilitas terjadinya suatu peristiwa acak X kurang dari -1,23 dengan 3 derajat kebebasan menggunakan fungsi `pt()` dengan argumen -1.23 dan df=3. Selanjutnya, kita dapat mencari probabilitas terjadinya suatu peristiwa acak X lebih besar dari 1,23 dengan 3 derajat kebebasan dengan menggunakan `1 - pt()` dengan argumen 1.23 dan df=3. Karena kita ingin mencari probabilitas terjadinya salah satu dari kedua peristiwa tersebut (kurang dari -1,23 atau lebih besar dari 1,23), maka probabilitas tersebut dapat dihitung dengan menjumlahkan kedua probabilitas tersebut.
```r
prob_c <- pt(-1.23, df=3) + (1 - pt(1.23, df=3))
prob_c
```
![5c](https://user-images.githubusercontent.com/114417418/236021094-c2b0b736-1c43-40e9-9d0e-aea6c3fad876.png)

d. Berapa probabilitas terjadinya suatu peristiwa acak X berada di antara -0,94 
dan 0,94 dengan 14 derajat kebebasan?
- Penyelesaian :
-  Digunakan fungsi `pt()` untuk menghitung probabilitas kumulatif dari distribusi t-Student. Argumen pertama adalah nilai t yang ingin dihitung probabilitasnya, dan argumen kedua adalah derajat kebebasan.
-  Maka untuk mencari probabilitas terjadinya suatu peristiwa acak X berada di antara -0,94 dan 0,94 dengan 14 derajat kebebasan, kita dapat menggunakan fungsi `pt()` untuk menghitung probabilitas kumulatif dari -0,94 dan 0,94, dan kemudian menguranginya untuk mendapatkan probabilitas di antara kedua nilai tersebut.
-  `prob_d <- pt(0.94, df=14) - pt(-0.94, df=14)` akan menghitung probabilitas terjadinya peristiwa acak X di antara -0,94 dan 0,94 dengan 14 derajat kebebasan dan akan menetapkan hasilnya ke variabel prob_d.
```r
prob_d <- pt(0.94, df=14) - pt(-0.94, df=14)
prob_d
```
![5d](https://user-images.githubusercontent.com/114417418/236021228-37c93949-21a8-4728-b0bb-826b8ef20e90.png)

e. Berapa nilai t-score dengan 5 derajat kebebasan yang memiliki luasan 0,0333 
satuan persegi di bawah kurva dan di sebelah kiri t-score tersebut?
- Penyelesaian : 
- `tscore_a <- qt(0.0333, df=5, lower.tail=TRUE)` digunakan untuk menghitung skor t berdasarkan distribusi t-student dengan derajat kebebasan (degrees of freedom) sebesar 5 dan tingkat signifikansi sebesar 0.0333.
- Fungsi qt() digunakan untuk menghitung nilai kritis t-score dari distribusi t-Student, dengan argumen pertama adalah nilai alpha (atau tingkat signifikansi), yang di sini diatur menjadi 0.0333 (yang setara dengan tingkat kepercayaan 96.67%). Argumen kedua adalah derajat kebebasan (degrees of freedom), yang di sini diatur sebesar 5. Argumen ketiga adalah lower.tail=TRUE yang menunjukkan bahwa t-score yang dihitung akan berada pada ekor distribusi t-Student di bawah titik potong (cutoff) yang ditentukan, yang sesuai dengan kasus ini karena lower.tail=TRUE.
```r
tscore_a <- qt(0.0333, df=5, lower.tail=TRUE)
tscore_a
```
![5e](https://user-images.githubusercontent.com/114417418/236021259-2dce3b88-46ea-480e-8aa4-8cff3ebedc96.png)

f. Berapa nilai t-score dengan 25 derajat kebebasan yang memiliki luasan 0,125 
satuan persegi di bawah kurva dan di sebelah kanan t-score tersebut?
- Penyelesaian : 
- `qt(0.125, df=25, lower.tail=FALSE)` merupakan fungsi untuk menghitung skor t dengan menggunakan nilai alpha atau signifikansi sebesar 0.125, dengan derajat kebebasan sebesar 25. Argumen lower.tail=FALSE menunjukkan bahwa skor t yang dihitung akan berada pada ekor distribusi t-Student di atas titik potong (cutoff) yang ditentukan.
- Fungsi qt() akan mengembalikan nilai t-score kritis yang dapat digunakan untuk menguji hipotesis nol pada uji t, yaitu apakah nilai mean sampel signifikan secara statistik terhadap nilai mean populasi atau tidak. Nilai t-score positif menunjukkan nilai rata-rata sampel yang lebih besar dari nilai rata-rata populasi yang diuji (one-tailed test), sedangkan nilai t-score negatif menunjukkan nilai rata-rata sampel yang lebih kecil dari nilai rata-rata populasi yang diuji (one-tailed test).
```r
tscore_b <- qt(0.125, df=25, lower.tail=FALSE)
tscore_b
```
![5f](https://user-images.githubusercontent.com/114417418/236021276-36f0e2e3-327b-4f07-a361-ca9c6ae7591e.png)

g. Berapa nilai t-score dengan 11 derajat kebebasan yang memiliki luasan 0,75 
satuan persegi di bawah kurva dan di antara t-score tersebut dan negatif dari 
nilai t-score tersebut?
- Penyelesaian :
- Menghitung skor t positif dan negatif yang sesuai dengan area under the curve (luas area) tertentu dari distribusi t-Student dengan derajat kebebasan (degrees of freedom) sebesar 11.
- Pada pernyataan pertama, df <- 11 menentukan derajat kebebasan sebagai 11. Kemudian, `upper_area <- 0.75` menentukan luas area di atas nilai t-score positif, yaitu sebesar 0.75 atau setara dengan tingkat kepercayaan 95%. Kemudian, `lower_area <- (1 - upper_area)/2` menghitung luas area di bawah nilai t-score positif, yang kemudian digunakan untuk mencari nilai t-score negatif.
- Selanjutnya, untuk mencari nilai t-score positif, pernyataan `t_score_pos <- qt(upper_area + lower_area, df)` digunakan. Fungsi qt() digunakan untuk menghitung nilai kritis t-score dari distribusi t-Student, dengan argumen pertama adalah luas area (atau probabilitas kumulatif) yang diinginkan, dalam hal ini dihitung dengan menambahkan luas area di atas dan di bawah nilai t-score yang diinginkan. Argumen kedua adalah derajat kebebasan, yang diatur sebesar 11. Hasil perhitungan ini disimpan dalam variabel t_score_pos.
- Selanjutnya, untuk mencari nilai t-score negatif, pernyataan `t_score_neg <- -1 * t_score_pos` digunakan. Karena distribusi t-Student simetris, maka nilai t-score negatif dapat ditemukan dengan mengalikan nilai t-score positif dengan -1. Hasil perhitungan ini disimpan dalam variabel t_score_neg.
- Dengan demikian, nilai t-score positif dan negatif yang sesuai dengan luas area di atas dan di bawah t-score tersebut masing-masing disimpan dalam variabel `t_score_pos` dan `t_score_neg`.
```r
df <- 11
upper_area <- 0.75
lower_area <- (1 - upper_area)/2

# mencari nilai t-score positif
t_score_pos <- qt(upper_area + lower_area, df)
# mencari nilai t-score negatif
t_score_neg <- -1 * t_score_pos

t_score_pos
t_score_neg
```
![5g](https://user-images.githubusercontent.com/114417418/236021431-90c3de15-85eb-4304-8f38-e14c3f60521b.png)

h. Berapa nilai t-score dengan 23 derajat kebebasan yang memiliki luasan 0,0333 
satuan persegi di bawah kurva dan di luar interval antara t-score tersebut dan 
negatif dari nilai t-score tersebut
- Penyelesaian :
- Menghitung skor t positif dan negatif yang sesuai dengan area under the curve (luas area) tertentu dari distribusi t-Student dengan derajat kebebasan (degrees of freedom) sebesar 23.
- Pada pernyataan pertama, df <- 23 menentukan derajat kebebasan sebagai 23. Kemudian, area <- 0.0333 menentukan luas area di tengah-tengah (middle area) dari distribusi t-Student, yang setara dengan 3.33% atau setara dengan tingkat signifikansi 0.0333.
- Selanjutnya, untuk mencari nilai t-score positif, pernyataan `t_pos <- qt(area/2, df, lower.tail = FALSE)` digunakan. Fungsi qt() digunakan untuk menghitung nilai kritis t-score dari distribusi t-Student, dengan argumen pertama adalah luas area (atau probabilitas kumulatif) yang diinginkan, dalam hal ini dihitung dengan membagi luas area di tengah-tengah dengan 2. Argumen kedua adalah derajat kebebasan, yang diatur sebesar 23. Argumen ketiga lower.tail = FALSE menunjukkan bahwa t-score yang dihitung akan berada pada ekor distribusi t-Student di atas titik potong (cutoff) yang ditentukan. Hasil perhitungan ini disimpan dalam variabel t_pos.
- Selanjutnya, untuk mencari nilai t-score negatif, pernyataan `t_neg <- qt(area/2, df)` digunakan. Fungsi qt() juga digunakan untuk menghitung nilai kritis t-score negatif dari distribusi t-Student dengan argumen yang sama seperti pada pernyataan sebelumnya. Hasil perhitungan ini disimpan dalam variabel t_neg.
```r
df <- 23
area <- 0.0333

# mencari nilai t-score positif
t_pos <- qt(area/2, df, lower.tail = FALSE)
# mencari nilai t-score negatif
t_neg <- qt(area/2, df)

t_neg
t_pos
```
![5h](https://user-images.githubusercontent.com/114417418/236021460-56bbe78c-fad3-480a-aa09-816ac20c10ff.png)

##### Halaman Kerja Nomor 5
![image](https://user-images.githubusercontent.com/114417418/236026015-13445cc1-e5e3-4ffc-8503-e6607c609c6c.png)
