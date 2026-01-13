##############################
# Step 1 Define Compute
##############################

compute_group_means <- function(data, scales){
  
  data |> 
    dplyr::summarize(x = mean(.data$x, na.rm = TRUE),      ### using `::` to indicate dependency from dplyr   
                     y = mean(.data$y, na.rm = TRUE))
  
}

##############################
# Step 2. Define Stat object
##############################
#' @name StatMeans
#'
#' ### using importFrom to indicate dependency from ggplot2, ggroto and Stat are used to define StatMeans   
#' @importFrom ggplot2 ggproto Stat  
#' @rdname Geom
#' @format NULL
#' @usage NULL
#' @export
StatMeans <- ggproto("StatMeans",
                     Stat,
                     compute_group = compute_group_means,
                     required_aes = c("x", "y"))



##############################
# Step 3. Define User-Facing Functions (w/ ggplot2 >=v4.0)
##############################

#' @export
#' @rdname stat_means
#' @importFrom ggplot2 make_constructor GeomPoint
#' @inheritParams ggplot2::stat_identity
#' 
#' @examples                               
#' ggplot(penguins) + 
#'  aes(x = bill_len, y = flipper_len, color = species) + 
#'  geom_point() + 
#'  stat_means(size = 9)
stat_means <- make_constructor(StatMeans, geom = GeomPoint)


#' @export
#' @rdname geom_means
#' @importFrom ggplot2 make_constructor GeomPoint
#' @inheritParams ggplot2::stat_identity
#' @examples
#' ggplot(penguins) + 
#'  aes(x = bill_len, y = flipper_len, color = species) + 
#'  geom_point() + 
#'  geom_means(size = 9)
geom_means <- make_constructor(GeomPoint, stat = StatMeans)



