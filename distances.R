
n <-
function(x,
         p = 2)
  
{
  as.numeric(dist(rbind(x,0), method = "minkowski", diag = FALSE, upper = FALSE, p = p))
}

d <-
function(x,
         y,
         p = 2)
{
  n(x-y, p)
}

d0 <-
function(x,
         y,
         p = 2)
{
  n(pmax(x, y), p) - min(n(x, p), n(y, p))
}

d1 <-
function(x,
         y,
         p = 2)
{
  2*n(pmax(x, y), p) - n(x, p) - n(y, p)
}

d2 <-
function(x,
         y,
         p = 2)
{
  sqrt(n(pmax(x, y), p)^2 - n(x, p)*n(y, p))
}
