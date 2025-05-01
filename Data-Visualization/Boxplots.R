# SECTION 1: Base R Boxplots

# 1.1 Basic Boxplot
set.seed(7)
x <- rnorm(200)
boxplot(x, main = "Basic Boxplot")

# 1.2 Horizontal Boxplot
boxplot(x, horizontal = TRUE, main = "Horizontal Boxplot")

# 1.3 Boxplot with Notches
boxplot(x, notch = TRUE, main = "Boxplot with Notches")

# 1.4 Customized Boxplot Appearance
boxplot(x, col = rgb(0, 0.5, 1, alpha = 0.5), border = "darkblue", main = "Customized Fill and Border")
boxplot(x, lty = 2, main = "Dashed Lines")

# 1.5 Boxplot Grouped by Factor
data(iris)
boxplot(Sepal.Length ~ Species, data = iris,
        col = c("lightblue", "lightgreen", "lightpink"),
        main = "Boxplot by Species")

# ---------------------------
# SECTION 2: ggplot2 Boxplots

# Load the ggplot2 package
library(ggplot2)

# 2.1 Basic Boxplot
set.seed(3)
y <- rnorm(500)
df <- data.frame(y = y)

ggplot(df, aes(y = y)) +
  geom_boxplot() +
  ggtitle("Basic ggplot2 Boxplot")

# 2.2 Horizontal Boxplot
ggplot(df, aes(x = y)) +
  geom_boxplot() +
  ggtitle("Horizontal Boxplot (Method 1)")

ggplot(df, aes(y = y)) +
  geom_boxplot() +
  coord_flip() +
  ggtitle("Horizontal Boxplot (Method 2)")

# 2.3 Grouped Boxplot
set.seed(136)
df_group <- data.frame(
  y = rnorm(300),
  group = sample(LETTERS[1:3], size = 300, replace = TRUE)
)

ggplot(df_group, aes(x = group, y = y)) +
  geom_boxplot() +
  ggtitle("Grouped Boxplot")

# 2.4 Boxplot with Jittered Points
ggplot(df_group, aes(x = group, y = y)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(width = 0.2, alpha = 0.5) +
  ggtitle("Boxplot with Jittered Points")

# 2.5 Customized Boxplot Appearance
ggplot(df_group, aes(x = group, y = y, fill = group)) +
  geom_boxplot(color = "black", alpha = 0.7) +
  theme_minimal() +
  labs(title = "Customized Boxplot", x = "Group", y = "Values") +
  scale_fill_manual(values = c("A" = "lightblue", "B" = "lightgreen", "C" = "lightpink"))

