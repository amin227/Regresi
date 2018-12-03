
sbm <- read.csv(file.choose(), header=TRUE)

sbm

ptn <- lm(PEMINAT.2017 ~ PEMINAT.2018, data = sbm)
summary(ptn)

plot(PEMINAT.2017 ~ PEMINAT.2018, data = sbm)
abline(ptn, col = "red", lwd = 1)

predict(ptn, data.frame(PEMINAT.2018 = 3000))

poly_ptn <- lm(PEMINAT.2017 ~ poly(PEMINAT.2018,degree=5), data = sbm)

poly_ptn
x <- with(sbm, seq(min(PEMINAT.2018), max(PEMINAT.2018), length.out=2000))

y <- predict(poly_ptn, newdata = data.frame(PEMINAT.2018 = x))
plot(PEMINAT.2017 ~ PEMINAT.2018, data = sbm)
lines(x, y, col = "red")
