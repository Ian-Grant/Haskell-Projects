module P36 where

import P35
import Data.List (group)

primeFactorsM x = fmap count $ group $ primeFactors x
                where count z = (head z, length z)
