module Puzzle10 where

open import Data.Nat
open import Data.List
open import Relation.Nullary
open import Data.Bool using (if_then_else_)
open import IO
open import Function
open import Data.Nat.Show

input = 1 ∷ 1 ∷ 1 ∷ 3 ∷ 1 ∷ 2 ∷ 2 ∷ 1 ∷ 1 ∷ 3 ∷ []

step : ℕ → ℕ → List ℕ → List ℕ
step cn co [] = co ∷ cn ∷ []
step cn co (x ∷ l) = if does (cn ≟ x)
  then step cn (suc co) l
  else co ∷ cn ∷ step x 1 l

encaps : List ℕ → List ℕ
encaps [] = []
encaps (x ∷ l) = step x 1 l

process : ℕ → List ℕ → List ℕ
process zero l = l
process (suc n) l = process n (encaps l)

main = run $ putStrLn $ show $ length $ process 50 input

