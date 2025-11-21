# Test name


name <- "replication_code_malaval"

# Mix
samples = "mix.csv"
colobj <- 1
colmix <- c(2,3,4)

# Sources
sources <- "sources.csv"
nomsrc <- 1
moysrc <- c(2,3,4)
etsrc <- c(9,10,11)
n <- 16

# Markov chain lenght
model_length <- "test" # test, fast, normal, long, very long, extreme


# Mix Parameters
mix_factors <- NULL
mix_fac_random <- NULL 
mix_fac_nested <- NULL
mix_cont_effects <- NULL

# Source Parameters
src_factors <- NULL
src_conc_dep <- FALSE
src_data_type <- "means"

# Error Parameter
resid_err <- FALSE
process_err <- TRUE
