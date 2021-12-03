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
parseExpression : (val : ℕ) (op : Operator) (toks : List Token) → (ℕ × List Token)
parseExpression val _ [] = val , []
parseExpression val op (LPAR ∷ toks) =
  let (val' , toks') = parseExpression 0 PLUS toks in parseExpression val op (NB val' ∷ toks')
parseExpression val _ (RPAR ∷ toks) = val , toks
parseExpression val _ (OP x ∷ toks) = parseExpression val x toks
parseExpression val PLUS (NB x ∷ toks) = parseExpression (val + x) PLUS toks
parseExpression val MULT (NB x ∷ toks) = parseExpression (val * x) MULT toks

{-# TERMINATING #-}
parseExpression' : (currentLeft : ℕ) (currentRight : ℕ) (toks : List Token) → (ℕ × List Token)
parseExpression' cl cr [] = cl * cr , []
parseExpression' cl cr (LPAR ∷ toks) =
  let (val' , toks') = parseExpression' 1 0 toks in parseExpression' cl cr (NB val' ∷ toks')
parseExpression' cl cr (RPAR ∷ toks) = cl * cr , toks
parseExpression' cl cr (OP PLUS ∷ toks) = parseExpression' cl cr toks
parseExpression' cl cr (OP MULT ∷ toks) = parseExpression' (cl * cr) 0 toks
parseExpression' cl cr (NB x ∷ toks) = parseExpression' cl (cr + x) toks

results : ℕ × ℕ
results =
  foldl (∣ _+_ ⟩- proj₁ ∘ (parseExpression 0 PLUS)) 0 inputs ,
  foldl (∣ _+_ ⟩- proj₁ ∘ (parseExpression' 1 0)) 0 inputs

main = run $ putStrLn $ uncurry (λ x y → "Réponse 1 : " ++ x ++ " ; Réponse 2 : " ++ y) $ map show show results
