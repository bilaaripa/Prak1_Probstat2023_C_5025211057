# a. Pendistribusian banyak bayi laki-laki
# distribusi binomial dengan n=10 dan p=0,488
n <- 10
p <- 0.488
k <- 0:10
dbinom(k, n, p)

# b. Probabilitas tepat 3 bayi laki-laki
prob_tepat_tiga <- dbinom(3, n, p)
prob_tepat_tiga

# c. Probabilitas kurang dari 3 bayi laki-laki
prob_kurang_tiga <- pbinom(2, n, p)
prob_kurang_tiga

# d. Probabilitas tiga atau lebih bayi laki-laki
prob_tiga_atas <- 1 - pbinom(2, n, p)
prob_tiga_atas

# e. Nilai harapan dan simpangan baku banyak bayi laki-laki
mean_laki_laki <- n * p
sd_laki_laki <- sqrt(n * p * (1 - p))
mean_laki_laki
sd_laki_laki

# f. Histogram pendistribusian banyak bayi laki-laki
set.seed(123)
bayi_laki <- rbinom(1000, n, p)
hist(bayi_laki, breaks=seq(-0.5, n+0.5, 1), main="Histogram Banyak Bayi Laki-laki", xlab="Jumlah Bayi Laki-laki", ylab="Frekuensi")

