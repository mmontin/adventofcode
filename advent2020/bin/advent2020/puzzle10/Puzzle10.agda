module Puzzle10 where

open import Data.List hiding (lookup)
open import Data.Nat
open import Data.Nat.Properties
open import Relation.Nullary
open import Data.Bool using (true ; false ; if_then_else_)
open import Data.Product
open import Data.Maybe
open import Foreign.Haskell.Either
open import Data.Tree.AVL <-strictTotalOrder renaming (Tree to Tree′)
open import Function
open import Data.Nat.Show
open import IO

Tree = Tree′ (MkValue (λ _ → Either (List ℕ) ℕ) constᵣ)

input = 0 ∷ 1 ∷ 2 ∷ 3 ∷ 4 ∷ 7 ∷ 10 ∷ 13 ∷ 16 ∷ 19 ∷ 20 ∷ 21 ∷ 24 ∷ 27 ∷ 28 ∷ 29 ∷ 30 ∷ 31 ∷ 34 ∷ 37 ∷ 38 ∷ 39 ∷ 40 ∷ 41 ∷ 44 ∷ 45 ∷ 46 ∷ 47 ∷ 48 ∷ 51 ∷ 54 ∷ 57 ∷ 58 ∷ 59 ∷ 60 ∷ 61 ∷ 64 ∷ 67 ∷ 68 ∷ 69 ∷ 70 ∷ 73 ∷ 74 ∷ 75 ∷ 76 ∷ 77 ∷ 80 ∷ 83 ∷ 84 ∷ 87 ∷ 90 ∷ 91 ∷ 92 ∷ 93 ∷ 94 ∷ 97 ∷ 100 ∷ 101 ∷ 102 ∷ 103 ∷ 104 ∷ 107 ∷ 108 ∷ 109 ∷ 110 ∷ 111 ∷ 114 ∷ 115 ∷ 116 ∷ 117 ∷ 118 ∷ 121 ∷ 122 ∷ 123 ∷ 126 ∷ 127 ∷ 128 ∷ 129 ∷ 132 ∷ 135 ∷ 136 ∷ 137 ∷ 138 ∷ 139 ∷ 142 ∷ 145 ∷ 146 ∷ 147 ∷ 150 ∷ 151 ∷ 152 ∷ 155 ∷ 156 ∷ 157 ∷ 160 ∷ 161 ∷ 162 ∷ 163 ∷ 164 ∷ 167 ∷ []

-- Returns the list of elements x such that x - seed ≤ 3 from the size first elements of l
pop≤3 : (seed : ℕ) → (size : ℕ) → (l : List ℕ) → List ℕ
pop≤3 _ zero _ = []
pop≤3 _ (suc _) [] = []
pop≤3 seed (suc size) (x ∷ l) =
  if does (x ∸ seed ≤? 3) then x ∷ pop≤3 seed size l else []

-- Creates a binary search tree where each node is annotated by a natural number coupled with
-- either the list of reachable elements (using pop≤3) or the number of possible paths from it
populate : List ℕ → Tree
populate [] = empty
populate (x ∷ []) = singleton x (right 1)
populate (x ∷ l@(y ∷ ys)) = insert x (left (pop≤3 x 3 l)) (populate l)

-- These mutual recursive functions return the number of possible paths for a given entry
-- while annotating the tree along the way so that each number of paths is only computed once
{-# TERMINATING #-}
process : (key : ℕ) → Tree → (Tree × ℕ)
processList : (keys : List ℕ) → Tree → (Tree × ℕ)

process key t with lookup key t
... | nothing = t , 0
... | just (left l) = let (t′ , v′) = processList l t in insert key (right v′) t′ , v′
... | just (right x) = t , x

processList [] t = t , 0
processList (k ∷ keys) t = let (t′ , v′) = process k t in let (t′′ , v′′) = processList keys t′ in t′′ , v′ + v′′

-- This function annotates all the nodes by going from the highest number (that leads nowhere)
-- to the smallest number which ensures that each iteration only has to annotate itself,
-- since they all rely on already annotated nodes. Then it returns the annotation of the entry point
doIt : List ℕ → ℕ
doIt l = (proj₂ ∘ (process 0) ∘ proj₁) (processList (reverse l) (populate l))

main = (run ∘ putStrLn ∘ show ∘ doIt) input
