
find_radius <-
function(x0, 
         r0, 
         theta, 
         d, 
         p)
{
  f <-
  function(r)
  {
    xr <- x0 + complex(modulus = r, argument = theta)
    d(c(max(Re(xr),0),max(Im(xr),0)), c(Re(x0),Im(x0)), p) - r0
  }
  if (theta >= 0 & theta <= pi/2) {
    Rmax <- (r0 + d(c(Re(x0), Im(x0)), 0, p))/d(c(cos(theta), sin(theta)), 0, p)
  } else if (theta > pi/2 & theta <= pi) {
    Rmax <- Re(x0)/cos(pi-theta)
  } else if (theta > pi & theta <= 5*pi/4) {
    Rmax <- Re(x0)/cos(theta-pi)
  } else if (theta > 5*pi/4 & theta <= 3*pi/2) {
    Rmax <- Im(x0)/cos(3*pi/2-theta)
  } else if (theta > 3*pi/2 & theta < 2*pi) {
    Rmax <- Im(x0)/cos(theta-3*pi/2)
  }
  
  if (Rmax==0) {
    R <- 0
  } else {
    R <- try(uniroot(f, interval = c(0, Rmax+.Machine$double.eps^0.25))$root, silent = TRUE)
    if (class(R)=="try-error") {
      g <- function(r) f(Rmax-r)
      R <- Rmax-optimize(g, interval = c(0, Rmax), maximum=TRUE)$max
    }
  }
  return(R)
}
