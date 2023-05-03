# Soal a - Fungsi probabilitas distribusi Chi-Square
x <- 3
v <- 10
prob_chisq <- dchisq(x, df = v)
prob_chisq

# Soal b - Histogram distribusi Chi-Square dengan 500 data acak
set.seed(123)
data_chisq <- rchisq(n = 500, df = v)
hist(data_chisq, main = "Histogram Distribusi Chi-Square", xlab = "Nilai", ylab = "Frekuensi")

# Soal c - Nilai rata-rata dan varians distribusi Chi-Square
set.seed(123)
k <- 10
mean_chisq <- mean(rchisq(n = 100000, df = k))
var_chisq <- var(rchisq(n = 100000, df = k))
mean_chisq
var_chisq


