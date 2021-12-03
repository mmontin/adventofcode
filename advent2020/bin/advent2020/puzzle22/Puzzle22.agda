open import Data.List
open import Data.Nat
open import Relation.Nullary
open import Data.Bool using (if_then_else_ ; Bool ; false ; true ; _∧_)
open import Data.Product
open import Function
open import Relation.Binary.PropositionalEquality
open import Relation.Binary

module Puzzle22 where

dec≡₁ : Decidable {A = List ℕ} _≡_
dec≡₁ [] [] = yes refl
dec≡₁ [] (_ ∷ _) = no (λ ())
dec≡₁ (_ ∷ _) [] = no (λ ())
dec≡₁ (x ∷ l₁) (x₁ ∷ l₂) with x ≟ x₁
... | no ¬p = no (λ {refl → ¬p refl})
... | yes refl with dec≡₁ l₁ l₂
... | yes refl = yes refl
... | no ¬p = no λ {refl → ¬p refl}

dec≡ : Decidable {A = List ℕ × List ℕ} _≡_
dec≡ (l₁ , l₂) (l₃ , l₄) with dec≡₁ l₁ l₃
... | no ¬p = no (λ {refl → ¬p refl})
... | yes refl with dec≡₁ l₂ l₄
... | yes refl = yes refl
... | no ¬p = no (λ {refl → ¬p refl})

open import Data.List.Membership.DecPropositional dec≡

joueur1 = (4 ∷ 25 ∷ 3 ∷ 11 ∷ 2 ∷ 29 ∷ 41 ∷ 23 ∷ 30 ∷ 21 ∷ 50 ∷ 8 ∷ 1 ∷ 24 ∷ 27 ∷ 10 ∷ 42 ∷ 43 ∷ 38 ∷ 15 ∷ 18 ∷ 13 ∷ 32 ∷ 37 ∷ 34 ∷ [])
joueur2 = (12 ∷ 6 ∷ 36 ∷ 35 ∷ 40 ∷ 47 ∷ 31 ∷ 9 ∷ 46 ∷ 49 ∷ 19 ∷ 16 ∷ 5 ∷ 26 ∷ 39 ∷ 48 ∷ 7 ∷ 44 ∷ 45 ∷ 20 ∷ 17 ∷ 14 ∷ 33 ∷ 28 ∷ 22 ∷ [])

score : (seed : ℕ) → (acc : ℕ) → List ℕ → ℕ
score _ acc [] = acc
score seed acc (x ∷ l) = score (suc seed) (seed * x + acc) l

result : List ℕ → ℕ
result l = score 1 0 (reverse l)

{-# TERMINATING #-}
partie : List ℕ → List ℕ → ℕ
partie [] l₂ = score 1 0 (reverse l₂)
partie l₁@(_ ∷ _) [] = score 1 0 (reverse l₁)
partie (x ∷ l₁) (x₁ ∷ l₂) = if does (x ≤? x₁)
  then partie l₁ (l₂ ++ x₁ ∷ x ∷ [])
  else partie (l₁ ++ x ∷ x₁ ∷ []) l₂

{-# TERMINATING #-}
partie₂ : (previousRounds : List (List ℕ × List ℕ)) → List ℕ → List ℕ → (Bool × ℕ)
partie₂ _ [] l₂ = false , result l₂
partie₂ _ l₁@(_ ∷ _) [] = true , result l₁
partie₂ prev l₁@(x₁ ∷ s₁) l₂@(x₂ ∷ s₂) with does ((l₁ , l₂) ∈? prev)
... | true = true , result l₁
... | false with does (x₁ ≤? (length s₁)) ∧ does (x₂ ≤? length s₂)
... | true = if proj₁ (partie₂ [] (take x₁ s₁) (take x₂ s₂))
  then partie₂ ((l₁ , l₂) ∷ prev) (s₁ ++ x₁ ∷ x₂ ∷ []) s₂
  else partie₂ ((l₁ , l₂) ∷ prev) s₁ (s₂ ++ (x₂ ∷ x₁ ∷ []))
... | false = if does (x₁ ≤? x₂)
  then partie₂ ((l₁ , l₂) ∷ prev) s₁ (s₂ ++ (x₂ ∷ x₁ ∷ []))
  else partie₂ ((l₁ , l₂) ∷ prev) (s₁ ++ x₁ ∷ x₂ ∷ []) s₂

open import IO
open import Data.Nat.Show

main = run $ putStrLn $ show $ proj₂ $ partie₂ [] joueur1 joueur2
