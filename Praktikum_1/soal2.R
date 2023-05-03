# a. Banyak kematian karena kanker tulang mengikuti distribusi Poisson dengan parameter λ = 1,8.
x <- 0
lambda <- 1.8
dpois(x, lambda)

# b. Probabilitas dari peristiwa 4 kematian akibat kanker tulang adalah 0,13, sehingga peristiwa ini tidak terlalu tidak biasa.
k <- 4
prob <- dpois(k, lambda)
prob

# c. Peluang paling banyak 4 kematian akibat kanker tulang adalah 0,68, sehingga tidak terlalu jarang terjadi.
k_max <- 4
prob_max <- ppois(k_max, lambda)
prob_max

# d. Peluang lebih dari 4 kematian akibat kanker tulang adalah 0,32, sehingga kemungkinan besar akan ada lebih dari 4 kematian akibat kanker tulang.
prob_more_than_4 <- 1 - prob_max
prob_more_than_4

# e. Nilai harapan banyak kematian akibat kanker tulang adalah 1,8 dan standar deviasi adalah 1,34.
mean <- lambda
sd <- sqrt(lambda)
mean
sd

# f. Histogram pendistribusian banyak kematian akibat kanker tulang.
n <- 1000
set.seed(123)
samples <- rpois(n, lambda)
hist(samples, breaks = seq(-0.5, max(samples) + 0.5, 1), main = "Histogram of Bone Cancer Deaths", xlab = "Number of Deaths")

# g. Simulasi untuk memeriksa hasil sebelumnya.
n_sim <- 1000
set.seed(123)
replicate(n_sim, {
  sum(rpois(1, lambda))
})

hist(replicate(n_sim, {sum(rpois(1, lambda))}), breaks = seq(-0.5, max(replicate(n_sim, {sum(rpois(1, lambda))
})) + 0.5, 1), col="blue", main="Simulasi Distribusi Poisson", xlab="Nilai", ylab="Frekuensi")


