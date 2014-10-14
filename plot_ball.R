
plot_ball <-
function(x0, 
         r0, 
         d, 
         p, 
         n = 100, 
         col = "blue", 
         lty = 2, 
         lwd = 2, 
         border = "black", 
         xlim = NULL, 
         ylim = NULL,  
         plot.it = TRUE, 
         ...)
{
  if (is.character(d)) d <- get(d)
  
  R <- x <- y <- c()
  thetas <- c(0:(n-1))*2*pi/n
  
  for (theta in thetas) {
    R0 <- find_radius(x0, r0, theta, d, p)
    R <- c(R, R0)
    xr <- x0 + complex(modulus = R0, argument = theta)
    x <- c(x, max(Re(xr),0))
    y <- c(y, max(Im(xr),0))
  }
  
  if (plot.it) {
    main <- paste0("Ball with center (", Re(x0), ",", Im(x0), ") and radius ", r0) 
    if (is.null(xlim)) xlim <- 1.1*max(x)
    if (is.null(ylim)) ylim <- 1.1*max(y)    
    plot(1, 1, type = "n", xlim = xlim, ylim = ylim, xlab = "x", ylab = "y", main = main)
    polygon(x, y, col = col, lty = lty, lwd = lwd, border = border, xpd = FALSE)
    points(x = Re(x0), y = Im(x0), col = 1, pch = 3)
  }
  
  return(invisible(list(R = R, x = x, y = y)))
}
