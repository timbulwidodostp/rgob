# Olah Data Semarang
# WhatsApp : +6285227746673
# IG : @olahdatasemarang_
# Generalized Oaxaca Blinder framework Use Package gwb/RGOB With (In) R Software
# Install Generalized Oaxaca Blinder framework Use Package gwb/RGOB With (In) R Software
install.packages("devtools")
library(devtools)
install_github("gwb/RGOB")
library(RGOB)
# Estimation Generalized Oaxaca Blinder framework Use Package gwb/RGOB With (In) R Software
# for replicability
set.seed(123)
# Generates synthetic data
# the number of units
N <- 100
X <- rnorm(N); B <- rnorm(N); C <- rnorm(N)
# the binary assignment vector
Z <- sample(c(0,1), N, replace=T)
# the observed outcomes
Y <- 1 + 0.2 * X + 0.5 * Z + rnorm(N, sd=0.1)
# a binary observed outcome
Yb <- ifelse(Y > 1.2, 1, 0)
# integer observed outcomes
Yp <- rpois(N, lambda=Y)
# Computes the point estimate and associated confidence interval
# using the separate slope adjustment (same as in Lin 2013)
gob(lm(Y ~ X + B), Z)
# Logistic regression adjustment
gob(glm(Yb ~ X + B, family=binomial(link="logit")), Z)
# Poisson regression adjustment
gob(glm(Yp ~ X + B, family=poisson), Z)
# Generalized Oaxaca Blinder framework Use Package gwb/RGOB With (In) R Software
# Olah Data Semarang
# WhatsApp : +6285227746673
# IG : @olahdatasemarang_
# Finished