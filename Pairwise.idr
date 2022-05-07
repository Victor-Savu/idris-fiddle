module Pairwise

import Data.Vect
import Data.Nat

%default total

export
pairwise : {n: Nat} -> Vect (n+n) a -> Vect n (a, a)
pairwise {n = 0} _ = Nil
pairwise {n = S k} (x::xs) =
    let
        y::ys = replace {p = \k => Vect k a} (sym (plusSuccRightSucc k k)) xs
    in
        (x, y)::(pairwise ys)
