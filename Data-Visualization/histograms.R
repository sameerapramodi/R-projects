# ------------------------------------------------------------------------------
# 1. Basic Histogram in Base R
# ------------------------------------------------------------------------------

# Sample data
set.seed(1)
x <- rexp(400)

# Basic frequency histogram
hist(x, main = "Basic Histogram", xlab = "Values", ylab = "Frequency")

# ------------------------------------------------------------------------------
# 2. Customized Histogram
# ------------------------------------------------------------------------------

# Blue histogram with white borders
hist(x, col = "blue", border = "white", main = "Blue Histogram", xlab = "Values")

# Histogram with shading lines
hist(x, col = "blue", density = 10, angle = 20,
     main = "Shaded Histogram", xlab = "Values")

# ------------------------------------------------------------------------------
# 3. Adding Density and Normal Curves
# ------------------------------------------------------------------------------

# Sample data
set.seed(3)
x <- rnorm(200)

# 3.1 Histogram with Density Curve
hist(x, prob = TRUE, main = "Histogram with Density Curve", xlab = "Values")
lines(density(x), col = "blue", lwd = 2)

# 3.2 Histogram with Normal Curve
x_seq <- seq(min(x), max(x), length = 40)
normal_curve <- dnorm(x_seq, mean = mean(x), sd = sd(x))
hist(x, prob = TRUE, col = "white", ylim = c(0, max(normal_curve)),
     main = "Histogram with Normal Curve", xlab = "Values")
lines(x_seq, normal_curve, col = "red", lwd = 2)

# ------------------------------------------------------------------------------
# 4. Grouped Histograms with ggplot2
# ------------------------------------------------------------------------------

# Load ggplot2
library(ggplot2)

# Sample data
set.seed(3)
x1 <- rnorm(500)
x2 <- rnorm(500, mean = 3)
x <- c(x1, x2)
group <- c(rep("G1", 500), rep("G2", 500))
df <- data.frame(x, group)

# Grouped histogram
ggplot(df, aes(x = x, fill = group)) +
  geom_histogram(alpha = 0.5, position = "identity") +
  ggtitle("Grouped Histogram") +
  xlab("Values") + ylab("Count")

# ------------------------------------------------------------------------------
# 5. Adjusting Bin Width Using the Sturges Method
# ------------------------------------------------------------------------------

# Sample data
set.seed(3)
x <- rnorm(450)
df <- data.frame(x)

# Calculate Sturges breaks
sturges_breaks <- pretty(range(x), n = nclass.Sturges(x), min.n = 1)

# Histogram with Sturges method
ggplot(df, aes(x = x)) +
  geom_histogram(color = "black", fill = "white", breaks = sturges_breaks) +
  ggtitle("Histogram with Sturges Method") +
  xlab("Values") + ylab("Count")

# ------------------------------------------------------------------------------
# End of Script
# ------------------------------------------------------------------------------

