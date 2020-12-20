module Puzzle18 where

open import Puzzle18Input
open import Data.List hiding (map ; _++_)
open import Data.Nat
open import Data.Nat.Show
open import Data.Product
open import Function
open import Data.String using (String ; _++_)
open import IO

{-# TERMINATING #-}
parse₁ : ℕ → Operator → List Token → (ℕ × List Token)
parse₁ v _    []          = v , []
parse₁ v op   (LPAR ∷ ts) = parse₁ v op (uncurry (NB -⟨ _∷_ ∣) (parse₁ 0 PLUS ts))
parse₁ v _    (RPAR ∷ ts) = v , ts
parse₁ v _    (OP x ∷ ts) = parse₁ v x ts
parse₁ v PLUS (NB x ∷ ts) = parse₁ (v + x) PLUS ts
parse₁ v MULT (NB x ∷ ts) = parse₁ (v * x) MULT ts

{-# TERMINATING #-}
parse₂ : ℕ → ℕ → List Token → (ℕ × List Token)
parse₂ l r []             = l * r , []
parse₂ l r (LPAR    ∷ ts) = parse₂ l r (uncurry (NB -⟨ _∷_ ∣) (parse₂ 1 0 ts))
parse₂ l r (RPAR    ∷ ts) = l * r , ts
parse₂ l r (OP PLUS ∷ ts) = parse₂ l r ts
parse₂ l r (OP MULT ∷ ts) = parse₂ (l * r) 0 ts
parse₂ l r (NB x    ∷ ts) = parse₂ l (r + x) ts

results : ℕ × ℕ
results =
  foldl (∣ _+_ ⟩- proj₁ ∘ (parse₁ 0 PLUS)) 0 inputs ,
  foldl (∣ _+_ ⟩- proj₁ ∘ (parse₂ 1 0   )) 0 inputs

main = run $ putStrLn $ uncurry (λ x y → "Réponse 1 : " ++ x ++ " ; Réponse 2 : " ++ y) $ map show show results
