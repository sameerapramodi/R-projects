# Load required libraries
library(igraph)
library(RColorBrewer)

# 1. Adjacency Matrix Example
set.seed(10)
adj_data <- matrix(sample(0:2, 25, replace = TRUE), nrow = 5)
colnames(adj_data) <- rownames(adj_data) <- LETTERS[1:5]
adj_network <- graph_from_adjacency_matrix(adj_data)
plot(adj_network, main = "Adjacency Matrix Network")

# 2. Incidence Matrix Example
set.seed(1)
inc_data <- matrix(sample(0:2, 15, replace = TRUE), nrow = 3)
colnames(inc_data) <- letters[1:5]
rownames(inc_data) <- LETTERS[1:3]
inc_network <- graph_from_incidence_matrix(inc_data)
plot(inc_network, main = "Incidence Matrix Network")

# 3. Edge List Example
links <- data.frame(
  source = c("A", "A", "A", "A", "A", "F", "B"),
  target = c("B", "B", "C", "D", "F", "A", "E")
)
edge_network <- graph_from_data_frame(d = links, directed = FALSE)
plot(edge_network, main = "Edge List Network")

# 4. Literal List of Connections Example
literal_network <- graph_from_literal(A - B - C - D, E - A - E - A, D - C - A, D - A - D - C)
plot(literal_network, main = "Literal List Network")

# 5. Mapping Variables to Node Features
# Create links data
links2 <- data.frame(
  source = c("A", "A", "A", "A", "A", "J", "B", "B", "C", "C", "D", "I"),
  target = c("B", "B", "C", "D", "J", "A", "E", "F", "G", "H", "I", "I"),
  importance = sample(1:4, 12, replace = TRUE)
)

# Create nodes data
nodes <- data.frame(
  name = LETTERS[1:10],
  carac = c(rep("young", 3), rep("adult", 2), rep("old", 5))
)

# Create the igraph object
network2 <- graph_from_data_frame(d = links2, vertices = nodes, directed = FALSE)

# Create color palette
coul <- brewer.pal(3, "Set1")

# Map colors based on "carac"
my_color <- coul[as.numeric(as.factor(V(network2)$carac))]

# Plot network with node colors
plot(network2, vertex.color = my_color, main = "Network with Node Features")

# Add legend for nodes
legend("bottomleft",
       legend = levels(as.factor(V(network2)$carac)),
       col = coul, bty = "n", pch = 20, pt.cex = 3, cex = 1.5,
       text.col = coul, horiz = FALSE, inset = c(0.1, 0.1))

# 6. Mapping Variables to Link Features
# Plot network with node colors and edge widths mapped to "importance"
plot(network2, vertex.color = my_color, edge.width = E(network2)$importance * 2,
     main = "Network with Node and Link Features")

# Add legend for nodes
legend("bottomleft",
       legend = levels(as.factor(V(network2)$carac)),
       col = coul, bty = "n", pch = 20, pt.cex = 3, cex = 1.5,
       text.col = coul, horiz = FALSE, inset = c(0.1, 0.1))

