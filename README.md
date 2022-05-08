I wrote this as an exercie proposed by my work colleague and office neighbor:

> Implement a (dependently typed) function that given a list of even length
> returns a list half the size by pairing up the elements on even indices
> with their respective neighbors on the next higher (odd) indices.
 
Example:

```
[0, 1, 2, 3, 4, 5, 6, 7] -> [(0, 1), (2, 3), (4, 5), (6, 7)]
```


## Trying it out

```
$ idris2 Pairwise.idr 
     ____    __     _         ___                                           
    /  _/___/ /____(_)____   |__ \                                          
    / // __  / ___/ / ___/   __/ /     Version 0.5.1
  _/ // /_/ / /  / (__  )   / __/      https://www.idris-lang.org           
 /___/\__,_/_/  /_/____/   /____/      Type :? for help                     

Welcome to Idris 2.  Enjoy yourself!
Pairwise> pairwise {n=4} [0, 1, 2, 3, 4, 5, 6, 7] 
[(0, 1), (2, 3), (4, 5), (6, 7)]
Pairwise> :t pairwise
Pairwise.pairwise : Vect (n + n) a -> Vect n (a, a)
```

## Example usage

Check out `Main.idr` for an example for how to use `pairwise`.

To run the example:

```
$ idris2 Main.idr -o example
$ ./build/exec/example
sumOfProds [8, 2, 3] = 46
```