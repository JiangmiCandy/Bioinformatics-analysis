for (pkg in cran_packages){
  if (! require(pkg,character.only=T,quietly = T) ) 
  
}