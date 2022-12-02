################################################################################
# Simulate a pedigree using guppy genotypes
## then drop 2 sires from data
## Used to see what MasterBayes does/can do to group siblings' missing sire
rm(list = ls())

setwd("~/Documents/teaching/AU_BIOL7960_PedigreeConstruction")

load(file = "guppy_3c-20msat.rdata")

library(MasterBayes)

# XXX
set.seed(1101)



A <- extractA(guppyG)
# Basic full-sibling pedigree with 2 offspring per family
ped <- matrix(NA, 16, 3)
ped[ ,1] <- seq.int(16)
ped[9:16, 2] <- rep(1:4, each = 2) 
ped[9:16, 3] <- rep(5:8, each = 2)
ped

# Simulate genotypes down the pedigree
G <- simgenotypes(A = A, E1 = 0.005, E2 = 0.005, ped = ped, no_dup = 1)
# Now drop 2 sires from data
redG <- G
  redG$G <- lapply(G$G, FUN = "[", i = -c(7:8))
  redG$Gid <- G$Gid[-c(7:8)]
  redG$Gobs <- lapply(G$Gobs, FUN = "[", i = -c(7:8))
  redG$id <- G$id[-c(7:8)]
# Check the lengths of things in the reduced dataset
lapply(redG, FUN = function(X) lapply(X, FUN = length))

redGdP <- GdataPed(G = redG$Gobs, id = redG$id)

dataP <- data.frame(id = ped[-c(7:8), 1])
  dataP$offspring <- c(rep(0, 6), rep(1, 8))
  dataP$sex <- c(rep("Female", 4), rep("Male", 2), rep(c("Female", "Male"), 4)) 
res1 <- expression(varPed(x = "offspring", restrict = 0))

PdP <- PdataPed(list(res1), data = dataP, USdam = FALSE, USsire = TRUE)

sP <- startPed(estG = TRUE, A = extractA(redG$Gobs),
  E1 = 0.005, estE1 = FALSE, E2 = 0.005, estE2 = FALSE,
  estUSsire = TRUE, USsire = 2, estUSdam = FALSE, USdam = 0)
  
redMod <- MCMCped(PdP = PdP, GdP = redGdP, sP = sP, jointP = FALSE, verbose = FALSE,
	write_postG = TRUE)
redMod$P

plot(redMod$USsire) 

modeP(redMod$P)  
  
# Males 7 and 8 taken out of data
## 7 sired 13 & 14
## 8 sired 15 & 16  

# If don't allow `USsire = TRUE`   in `PdataPed()` then `MCMCped()` will assign
## INCORRECT male as sires of individuals 13-16
