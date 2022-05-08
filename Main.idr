module Main

import Data.Vect
import Pairwise

%default total

export
prods : {n: Nat} -> Vect (n+n) Nat -> Vect n Nat
prods v = map (\(k, u) => k*u) (pairwise v)

export
sumOfProds : {n: Nat} -> Vect n Nat -> Nat
sumOfProds v = foldr (+) 0 (prods (v ++ v))

main : IO()
main =
    let s = sumOfProds [8, 2, 3] in
    putStrLn "sumOfProds [8, 2, 3] = \{show s}"