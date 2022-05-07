import Data.Vect
import Data.Nat

pairwise : {n: Nat} -> Vect (n+n) a -> Vect n (a, a)
pairwise {n = 0} v = Nil
pairwise {n = S 0} (x::y::Nil) = [(x, y)]
pairwise {n = S (S k)} (x::y::xs) =
    (x, y)::(pairwise (
        rewrite sym (plusSuccRightSucc k k) in
        rewrite sym (plusCommutative k (S (S k))) in
        xs))
