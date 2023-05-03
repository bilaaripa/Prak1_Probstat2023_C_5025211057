# a. probabilitas terjadinya suatu peristiwa acak X kurang dari -2,34 dengan 6 derajat kebebasan
prob_a <- pt(-2.34, df=6)
prob_a

# b. probabilitas terjadinya suatu peristiwa acak X lebih dari 1,34 dengan 6 derajat kebebasan
prob_b <- 1 - pt(1.34, df=6)
prob_b

# c. probabilitas terjadinya suatu peristiwa acak X kurang dari -1,23 atau lebih besar dari 1,23 dengan 3 derajat kebebasan
prob_c <- pt(-1.23, df=3) + (1 - pt(1.23, df=3))
prob_c

# d. probabilitas terjadinya suatu peristiwa acak X berada di antara -0,94 dan 0,94 dengan 14 derajat kebebasan
prob_d <- pt(0.94, df=14) - pt(-0.94, df=14)
prob_d

# e. nilai t-score dengan 5 derajat kebebasan yang memiliki luasan 0,0333 satuan persegi di bawah kurva dan di sebelah kiri t-score tersebut
tscore_a <- qt(0.0333, df=5, lower.tail=TRUE)
tscore_a

# f. nilai t-score dengan 25 derajat kebebasan yang memiliki luasan 0,125 satuan persegi di bawah kurva dan di sebelah kanan t-score tersebut
tscore_b <- qt(0.125, df=25, lower.tail=FALSE)
tscore_b

# g. nilai t-score dengan 11 derajat kebebasan yang memiliki luasan 0,75 satuan persegi di bawah kurva dan di antara t-score tersebut dan negatif dari nilai t-score tersebut
# Mencari nilai t-score menggunakan qt()
df <- 11
upper_area <- 0.75
lower_area <- (1 - upper_area)/2
# mencari nilai t-score positif
t_score_pos <- qt(upper_area + lower_area, df)
# mencari nilai t-score negatif
t_score_neg <- -1 * t_score_pos
t_score_pos
t_score_neg

# h. nilai t-score dengan 23 derajat kebebasan yang memiliki luasan 0,0333 satuan persegi di bawah kurva dan di luar interval antara t-score tersebut dan negatif dari nilai t-score tersebut
df <- 23
area <- 0.0333
# mencari nilai t-score positif
t_pos <- qt(area/2, df, lower.tail = FALSE)
# mencari nilai t-score negatif
t_neg <- qt(area/2, df)
t_neg
t_pos

