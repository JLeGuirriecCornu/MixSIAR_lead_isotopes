setwd(here::here()) #Resets the working directory


library(MixSIAR)
library(ggplot2)
library(gridExtra)

source("modifiedMIXSIAR.R")

source("model_config.R")

source("model_preload.R")


setwd(folder)

# Load mix data

mix <- load_mix_data(filename="mixingMS.csv",
					 iso_names=c("isotope1","isotope2", "isotope3"),
					 factors = mix_factors,
					 fac_random = mix_fac_random,
					 fac_nested = mix_fac_nested,
					 cont_effects = mix_cont_effects)

# Load source data

source <- load_source_data(filename="sourcesMS.csv",
						   source_factors = src_factors,
						   data_type = src_data_type,
						   conc_dep = src_conc_dep,
						   mix)

# Load discrimination/TDF data

discr <- load_discr_data(filename="discrMS.csv", mix)

# Make isospace plot
plot_data(filename="isospace_plot",
		  plot_save_pdf=TRUE,
		  plot_save_png=FALSE,
		  mix,source,discr)

# Calculate standardized convex hull area
if(mix$n.iso==2) calc_area(source=source,mix=mix,discr=discr)

# Plot your prior
#plot_prior(alpha.prior=1,source)

# Define model structure and write JAGS model file
model_filename <- "MixSIAR_model.txt"

write_JAGS_model(model_filename, resid_err, process_err, mix, source)

# Run the JAGS model ("test" first, then "short")
jags.1 <- run_model(run=model_length, mix, source, discr, model_filename, alpha.prior=1)
#jags.1 <- run_model(run="short", mix, source, discr, model_filename, alpha.prior=1)

# Process diagnostics, summary stats, and posterior plots
output_JAGS2(jags.1, mix, source)

combined <- combine_sources(jags.1, mix, source, groups=list(France=source$source_names[c(1,2,5,6,7,10)], England=source$source_names[c(3,4,9)], Sardinia=source$source_names[8]))

summary_stat(combined, meanSD=TRUE, quantiles=c(.025,.25,.5,.75,.975), savetxt=FALSE)