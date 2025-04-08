library(ggplot2)
library(patchwork)

# 1. Histogram of MPG with custom aesthetics
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = '#69b3a2', color = 'darkgreen') +
  labs(title = 'Histogram of MPG', x = 'Miles per Gallon (MPG)', y = 'Frequency') +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = '#2e8b57')) +
  theme(panel.grid.major = element_line(color = 'gray', size = 0.5))

# 2. Histogram of MPG by Cylinders with color aesthetics
ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_histogram(binwidth = 2, position = 'dodge', color = 'black') +
  labs(title = 'Histogram of MPG by Cylinder Type', x = 'Miles per Gallon (MPG)', y = 'Frequency') +
  scale_fill_brewer(palette = "Set3", name = "Cylinder Type") +
  theme_classic(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = '#9932cc'))

# 3. Density Plot of MPG with lighter color and grid
ggplot(mtcars, aes(x = mpg)) +
  geom_density(fill = '#98c9e2', alpha = 0.6) +
  labs(title = 'Density Plot of MPG', x = 'Miles per Gallon (MPG)', y = 'Density') +
  theme_light(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = '#4682b4')) +
  theme(panel.grid.major = element_line(color = 'lightgray', size = 0.5))

# 4. Density Plot by Cylinder with distinct colors
ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_density(alpha = 0.5) +
  labs(title = 'Density Plot of MPG by Cylinder', x = 'Miles per Gallon (MPG)', y = 'Density') +
  scale_fill_manual(values = c("#ff6347", "#32cd32", "#8a2be2"), name = "Cylinder Type") +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = '#2f4f4f'))

# 5. Boxplot of MPG by Cylinder with custom grid
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = '#ffb6c1', color = 'black') +
  labs(title = 'Boxplot of MPG by Cylinder', x = 'Number of Cylinders', y = 'Miles per Gallon (MPG)') +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = '#d2691e')) +
  theme(panel.grid.major = element_line(color = 'lightgray', size = 0.5))

# 6. Notched Boxplot of MPG by Cylinder (Horizontal)
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(notch = TRUE, fill = '#dda0dd', color = 'black') +
  coord_flip() +
  labs(title = 'Boxplot of MPG by Cylinder (Notched)', x = 'Miles per Gallon (MPG)', y = 'Number of Cylinders') +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = 'black')) +
  theme(panel.grid.major = element_line(color = 'lightgray', size = 0.5))

# 7. Bar Plot of Cylinders with custom color and title
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(fill = 'lightgreen', color = 'black') +
  labs(title = 'Bar Plot of Number of Cylinders', x = 'Number of Cylinders', y = 'Count') +
  theme_light(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = 'black')) +
  theme(panel.grid.major = element_line(color = 'lightgray', size = 0.5))

# 8. Stacked Bar Plot by Cylinder and Transmission Type
ggplot(mtcars, aes(x = factor(cyl), fill = factor(am))) +
  geom_bar(position = 'stack') +
  labs(title = 'Bar Plot of Cylinders by Transmission Type', x = 'Number of Cylinders', y = 'Count') +
  scale_fill_brewer(palette = 'Paired', name = 'Transmission Type') +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = 'black'))

ggplot(mtcars, aes(x = factor(cyl), fill = factor(am))) +
  geom_bar(position = 'stack', color = 'black') +  # Added black border for clarity
  labs(title = 'Bar Plot of Cylinders by Transmission Type', 
       x = 'Number of Cylinders', 
       y = 'Count') +
  scale_fill_manual(values = c('lightgreen', 'seagreen'), name = 'Transmission Type') +  # Custom green hues
  theme_light(base_size = 15) +
  theme(
    plot.title = element_text(face = 'bold', color = 'black'),
    panel.grid.major = element_line(color = 'lightgray', size = 0.5)  # Light gray grid
  )


# 9. Dot Plot of MPG by Cylinder with jittered points
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_jitter(color = 'purple', width = 0.2, height = 0) +
  labs(title = 'Dot Plot of MPG by Cylinder', x = 'Number of Cylinders', y = 'Miles per Gallon (MPG)') +
  theme_light(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = 'black'))

# 10. Dot Plot of MPG by Cylinder with HP Color Mapping
ggplot(mtcars, aes(x = factor(cyl), y = mpg, color = hp)) +
  geom_jitter(width = 0.2, height = 0, size = 3) +
  scale_color_gradient(low = 'yellow', high = 'red') +
  labs(title = 'Dot Plot of MPG by Cylinder with HP Color Mapping', x = 'Number of Cylinders', y = 'Miles per Gallon (MPG)') +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = '#2e8b57'))

# 11. Pie Chart of Cylinder Distribution with Percentages
# Create a table of cylinder counts
cyl_count <- table(mtcars$cyl)

# Generate the pie chart
ggplot(as.data.frame(cyl_count), aes(x = '', y = Freq, fill = factor(Var1))) +
  geom_bar(stat = 'identity', width = 1) +
  coord_polar(theta = 'y') +
  labs(title = 'Pie Chart of Cylinder Distribution', x = NULL, y = NULL) +
  theme_void() +  # Removes background grid for a clean look
  scale_fill_manual(values = c('#A8D5BA', '#FDD692', '#BFD7EA'), name = 'Cylinders') +  # Light colors
  geom_text(aes(label = scales::percent(Freq / sum(Freq))),
            position = position_stack(vjust = 0.5), color = 'black', fontface = 'bold') +
  theme(plot.title = element_text(face = 'bold', size = 16))


cyl_count <- table(mtcars$cyl)

ggplot(as.data.frame(cyl_count), aes(x = '', y = Freq, fill = factor(Var1))) +
  geom_bar(stat = 'identity', width = 1, color = 'black') +  # Black border for clarity
  coord_polar(theta = 'y') +
  theme_void() +  # Removes background grid
  geom_text(aes(label = scales::percent(Freq / sum(Freq))),
            position = position_stack(vjust = 0.5), color = 'black', fontface = 'bold') +  # Black text for contrast
  scale_fill_manual(values = c('#FFDDC1', '#D4E157', '#80CBC4'), name = 'Cylinders') +  # Light pastel shades
  labs(title = 'Cylinder Distribution (Pie Chart)') +
  theme(
    plot.title = element_text(face = 'bold', color = 'black', size = 16)
  )


# 12. Scatterplot of MPG vs Horsepower
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(shape = 24, fill = '#80CBC4', color = 'black', size = 4) +  # Use triangles
  labs(title = 'Scatterplot of MPG vs Horsepower', x = 'Horsepower', y = 'Miles per Gallon (MPG)') +
  theme_light(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = 'black'))


# 13. 2D Density Plot of MPG vs Weight with points
one <- ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_density_2d() + 
  geom_point(color = '#32cd32') +
  labs(title = "2D Density Plot", subtitle = "Weight vs MPG") +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(face = 'bold', color = '#4682b4'))


ggplot(mtcars, aes(x = hp, y = mpg, fill = factor(cyl))) +
  geom_point(shape = 24, color = 'black', size = 4) +  # Use triangles, black border
  scale_fill_manual(values = c("#80CBC4", "#64B5F6", "#AED581")) +  # Custom colors for cylinders
  labs(
    title = "Scatterplot of MPG vs Horsepower with Cylinder Color Mapping",
    x = "Horsepower",
    y = "Miles per Gallon (MPG)",
    fill = "Cylinders"
  ) +
  theme_light(base_size = 15) +
  theme(plot.title = element_text(face = "bold", color = "black"))

# 14. 2D Filled Density Plot with Rug and No Legend
two <- ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_density_2d_filled() +
  geom_rug() +
  theme_void(base_size = 15) +
  theme(legend.position = 'none')

# Combine Plots
one + two

