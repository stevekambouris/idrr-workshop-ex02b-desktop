# Example: Calculating a bootstrapped confidence interval


# Import the penguins data set from CSV
data_penguins <- read.csv("data_penguins.csv")


# Calculate the confidence interval around the mean flipper length for all
# penguins
ostt_flipper_len <- t.test(data_penguins$flipper_len)
print(ostt_flipper_len)


# Calculate a confidence interval around the median using a custom bootstrap
# function.
my_bootstrap_mean <- function(indata) {
  mean(sample(indata, length(indata), replace = TRUE), na.rm = TRUE)
}


# Run 10000 re-samplings of the flipper length data
# Set a random seed for reproducibility
set.seed(42)
x <- replicate(10000, my_bootstrap_mean(data_penguins$flipper_len))


# Compare the 95% confidence interval from the bootstrap to the real interval
boot_confint <- quantile(x, c(0.025, 0.975))
print(boot_confint)
