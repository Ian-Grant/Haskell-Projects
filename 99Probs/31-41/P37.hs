module P37 where

import P36

totient' x = product [(y-1)* y ^ (z-1) | (y,z) <- primeFactorsM x]
