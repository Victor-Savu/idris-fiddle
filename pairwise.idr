import Data.Vect
import Data.Nat

pairwise : {n: Nat} -> Vect (n+n) a -> Vect n (a, a)
pairwise {n = 0} _ = Nil
pairwise {n = S k} (x::xs) =
    let
        vectPlusSuccRightSucc : Vect (n + S n) a -> Vect (S (n+n)) a
        vectPlusSuccRightSucc as = rewrite plusSuccRightSucc n n in as
    in
    let
        y::ys = vectPlusSuccRightSucc xs
    in
        (x, y)::(pairwise ys)
