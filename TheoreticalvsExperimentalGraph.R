# This R script contains R code for creating a scatter plot of Theoretical vs Experimental values

# Read in the libraries needed
library(tidyverse)

# the graphnums.tab file is saved in my current working directory
# Read in the tab delimited file
graphnums <- read_tsv("graphnums.tab")
# Use ggplot to plot the points with geom_point to create the scatter plot and geom_smooth to create the line of best fit
graphnumsScatter <- ggplot(
  graphnums,
  aes(
    x = Theoretical,
    y = Experimental
  )
) +
geom_point(
  aes(
    colour = Category # Colour by the category (leaving colours as default colours)
  )
) +
geom_smooth(
  method=lm,
  se=FALSE,
  colour = "grey"
)

# Create a small function to edit some of the features on the plot
edit_plots <- function(
    ggplot_object
) {
    ggplot_object <- ggplot_object +
    theme(axis.title.x = element_text(margin = margin(b = 1, unit = 'cm'),
                                      vjust = -5,
                                      size = 14),
          axis.title.y = element_text(margin = margin(l = 1, unit = 'cm'),
                                      vjust = 5,
                                      size = 14),
          axis.text.x = element_text(size = 12,
                                     colour = 'black'),
          axis.text.y = element_text(size = 12,
                                     colour = 'black'),
          legend.text = element_text(size = 12,
                                     colour = 'black'),
          legend.title = element_text(size = 14,
                                      colour = 'black'),
          strip.text = element_text(
              size = 14,
              colour = "black",
              face = "bold"
          ),
          strip.background = element_blank(),
          plot.margin = unit(c(1,1,1,1), "cm"),
          panel.background = element_blank(),
          panel.grid = element_blank(),
          axis.line = element_line(colour = "black")
          ) # Not sure what else I need to add - but for now this if fine
    return(ggplot_object)
}

# Run the plot object through the edit_plots function to edit the features
graphnumsScatter <- edit_plots(graphnumsScatter)

# Save the plot to current working directory
ggsave(
  filename = "./graphnumsScatter.png",
  plot = graphnumsScatter,
  dpi = 900
)

# Note:
# The saved image can be found under results
