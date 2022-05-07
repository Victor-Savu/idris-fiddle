import Data.Vect
import Data.Nat

plusSucc2RightSucc2 : (left: Nat) -> (right: Nat) -> left + S (S right) = S ( S ( left + right))
plusSucc2RightSucc2 0 right = Refl
plusSucc2RightSucc2 (S k) right = rewrite plusSucc2RightSucc2 k right in Refl

not_the_middle: {n: Nat} -> Vect (n + S n) a -> Vect (S (n+n)) a
not_the_middle {n = 0} (x::[]) = [x]
not_the_middle {n = S k} (x :: xs) =
    rewrite sym (plusSuccRightSucc k k) in
    rewrite sym (plusSucc2RightSucc2 k k) in x::xs

pairwise : {n: Nat} -> Vect (n+n) a -> Vect n (a, a)
pairwise {n = 0} v = Nil
pairwise {n = S k} (x::xs) =
    let
        y::ys = not_the_middle xs
    in
        (x, y)::(pairwise ys)
