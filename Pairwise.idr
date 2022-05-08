module Pairwise

import Data.Vect
import Data.Nat

%default total

export
pairwise : {1 n: Nat} -> (1 _: Vect (n+n) a) -> Vect n (a, a)
pairwise {n = 0} Nil = Nil
pairwise {n = S k} (x::xs) =
    let
        y::ys = replace {p = \k => Vect k a} (sym (plusSuccRightSucc k k)) xs
    in
        (x, y)::(pairwise ys)
