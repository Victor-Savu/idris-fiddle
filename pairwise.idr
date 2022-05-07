import Data.Vect
import Data.Nat

plusSucc2RightSucc2 : (left: Nat) -> left + S (S left) = S ( S ( left + left))
plusSucc2RightSucc2 k = rewrite plusSucc2RightSucc2 k in Refl

pairwise : {n: Nat} -> Vect (n+n) a -> Vect n (a, a)
pairwise {n = 0} v = Nil
pairwise {n = S 0} (x::y::Nil) = [(x, y)]
pairwise {n = S (S k)} (x::y::xs) =
    (x, y)::(pairwise (
        rewrite sym (plusSuccRightSucc k k) in
        rewrite sym (plusSucc2RightSucc2 k) in
        xs))
