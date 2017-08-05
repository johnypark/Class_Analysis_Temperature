#example of tile color 

## required packages (plot, melt data frame, and rolling function)
library(ggplot2)
library(reshape)
library(zoo)

## repeat random selection
set.seed(1)

## create 50x10 matrix of random values from [-1, +1]
random_matrix <- matrix(runif(500, min = -1, max = 1), nrow = 50)

## set color representation for specific values of the data distribution
quantile_range <- quantile(random_matrix, probs = seq(0, 1, 0.2))

## use http://colorbrewer2.org/ to find optimal divergent color palette (or set own)
color_palette <- colorRampPalette(c("#3794bf", "#FFFFFF", "#df8640"))(length(quantile_range) - 1)

## prepare label text (use two adjacent values for range text)
label_text <- rollapply(round(quantile_range, 2), width = 2, by = 1, FUN = function(i) paste(i, collapse = " : "))

## discretize matrix; this is the most important step, where for each value we find category of predefined ranges (modify probs argument of quantile to detail the colors)
mod_mat <- matrix(findInterval(random_matrix, quantile_range, all.inside = TRUE), nrow = nrow(random_matrix))

## remove background and axis from plot
theme_change <- theme(
  plot.background = element_blank(),
  panel.grid.minor = element_blank(),
  panel.grid.major = element_blank(),
  panel.background = element_blank(),
  panel.border = element_blank(),
  axis.line = element_blank(),
  axis.ticks = element_blank(),
  axis.text.x = element_text(angle = 45),
  axis.text.y = element_blank(),
  axis.title.x = element_blank(),
  axis.title.y = element_blank()
)
melt(mod_mat)%<>%mutate(X3=1)
## output the graphics
f.1<-ggplot(melt(mod_mat)%>%mutate(X3=1), aes(x = X1, y=X3,fill = factor(value))) +
  geom_tile(color = "black") +
  scale_fill_manual(values = color_palette, name = "", labels = label_text) +
  theme_change+theme(legend.position = "")+
  scale_x_continuous(breaks=c(0:50))
