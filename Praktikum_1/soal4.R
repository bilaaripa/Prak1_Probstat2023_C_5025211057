# Soal a
# Menghitung X1, X2, z-score, dan fungsi probabilitas dari distribusi Normal
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

# Soal b
# Membuat histogram dari distribusi Normal
set.seed(123)
hist(data, breaks = 50, col = "green", main = "Histogram Distribusi Normal", xlab = "Nilai")

# Soal c
# Menghitung varian dari data bangkitan acak
varian <- var(data)
varian