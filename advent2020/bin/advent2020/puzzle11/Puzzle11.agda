module Puzzle11 where

open import Data.List renaming (map to mapₗ) hiding (lookup ; _++_)
open import Puzzle11Input
open import Data.Product
open import Data.Nat
open import Data.Nat.Properties
open import Relation.Binary
open import Agda.Primitive
open import Relation.Binary.PropositionalEquality
open import Function
open import Relation.Nullary
open import Data.Bool using (Bool ; true ; false ; if_then_else_ ; _∧_ ; not ; _∨_)
open import Data.Empty
open import Data.Nat.Show
open import IO
open import Data.Maybe
open import Debug.Trace
open import Data.String using (_++_)

Pair : Set
Pair = ℕ × ℕ

data _<ₚ_ : Rel Pair lzero where
  l<l : ∀ {a b c d} → a < c → (a , b) <ₚ (c , d)
  r<r : ∀ {a b d} → b < d → (a , b) <ₚ (a , d)

<ₚ-cmp : Trichotomous _≡_ _<ₚ_
<ₚ-cmp (a , b) (c , d) with <-cmp a c | <-cmp b d
... | tri< a₁ ¬b ¬c | tri< a₂ ¬b₁ ¬c₁ = tri< (l<l a₁) (λ {refl → ¬c₁ a₂}) λ {(l<l x) → ¬c x ; (r<r x) → ¬c₁ x}
... | tri< a₁ ¬b ¬c | tri≈ ¬a refl ¬c₁ = tri< (l<l a₁) (λ {refl → ¬c a₁}) λ {(l<l x) → ¬c x ; (r<r x) → ¬c₁ x}
... | tri< a₁ ¬b ¬c | tri> ¬a ¬b₁ c₁ = tri< (l<l a₁) (λ {refl → ¬b₁ refl}) λ {(l<l x) → ¬c x ; (r<r x) → ¬c a₁}
... | tri≈ ¬a refl ¬c | tri< a₁ ¬b ¬c₁ = tri< (r<r a₁) (λ {refl → ¬c₁ a₁}) λ {(l<l x) → ¬c x ; (r<r x) → ¬c₁ x}
... | tri≈ ¬a refl ¬c | tri≈ ¬a₁ refl ¬c₁ = tri≈ (λ {(l<l x) → ¬c x ; (r<r x) → ¬c₁ x}) refl λ { (l<l x) → ¬c x ; (r<r x) → ¬c₁ x}
... | tri≈ ¬a refl ¬c | tri> ¬a₁ ¬b c₁ = tri> (λ {(l<l x) → ¬c x ; (r<r x) → ¬a₁ x}) (λ {refl → ¬b refl}) (r<r c₁)
... | tri> ¬a ¬b c₁ | tri< a₁ ¬b₁ ¬c = tri> (λ {(l<l x) → ¬a x ; (r<r x) → ¬b refl}) (λ {refl → ¬c a₁}) (l<l c₁)
... | tri> ¬a ¬b c₁ | tri≈ ¬a₁ refl ¬c = tri> (λ {(l<l x) → ¬a x ; (r<r x) → ¬c x}) (λ {refl → ¬b refl}) (l<l c₁)
... | tri> ¬a ¬b c₁ | tri> ¬a₁ ¬b₁ c₂ = tri> (λ {(l<l x) → ¬a x ; (r<r x) → ¬a₁ x}) (λ {refl → ¬b₁ refl}) (l<l c₁)

<ₚ-isStrictTotalOrder : IsStrictTotalOrder _≡_ _<ₚ_
<ₚ-isStrictTotalOrder = record {
  isEquivalence = isEquivalence ;
  trans = λ {
    (l<l x) (l<l y) → l<l (<-trans x y) ;
    (l<l x) (r<r _) → l<l x ;
    (r<r _) (l<l x) → l<l x ;
    (r<r x) (r<r y) → r<r (<-trans x y)} ;
  compare = <ₚ-cmp }

_≡?_ : Decidable {A = SeatType} _≡_
EMPTY ≡? EMPTY = yes refl
EMPTY ≡? NOTHING = no (λ ())
EMPTY ≡? TAKEN = no (λ ())
NOTHING ≡? EMPTY = no (λ ())
NOTHING ≡? NOTHING = yes refl
NOTHING ≡? TAKEN = no (λ ())
TAKEN ≡? EMPTY = no (λ ())
TAKEN ≡? NOTHING = no (λ ())
TAKEN ≡? TAKEN = yes refl

open import Data.Tree.AVL (record { isStrictTotalOrder = <ₚ-isStrictTotalOrder })
  renaming (Tree to Tree′)

Tree = Tree′ (MkValue (λ _ → SeatType × List Pair) constᵣ)

data Direction : Set where
  N  : Direction
  E  : Direction
  S  : Direction
  O  : Direction
  NE : Direction
  NO : Direction
  SE : Direction
  SO : Direction

incr : Pair → Direction → Pair
incr (i , j) N = i ∸ 1 , j
incr (i , j) E = i , j + 1
incr (i , j) S = i + 1 , j
incr (i , j) O = i , j ∸ 1
incr (i , j) NE = i ∸ 1 , j + 1
incr (i , j) NO = i ∸ 1 , j ∸ 1
incr (i , j) SE = i + 1 , j + 1
incr (i , j) SO = i + 1 , j ∸ 1

inBounds : (limits : Pair) → Pair → Bool
inBounds (mi , mj) (i , j) = does (i ≤? mi) ∧ does (j ≤? mj) ∧ does (1 ≤? i) ∧ does (1 ≤? j)

{-# TERMINATING #-}
appendNextInDirection : (d : Direction) (limits : Pair) → Pair → Tree → List Pair → List Pair
appendNextInDirection d limits p t l =
  if inBounds limits p
  then case lookup p t of
    (λ {nothing → l ;
      (just (NOTHING , _)) → appendNextInDirection d limits (incr p d) t l ;
      (just (_ , _)) → p ∷ l})
  else l

neighbours2 : (limits : Pair) → Pair → Tree → List Pair
neighbours2 limits p t =
  appendNextInDirection N limits (incr p N) t
  (appendNextInDirection S limits (incr p S) t
  (appendNextInDirection E limits (incr p E) t
  (appendNextInDirection O limits (incr p O) t
  (appendNextInDirection NE limits (incr p NE) t
  (appendNextInDirection NO limits (incr p NO) t
  (appendNextInDirection SE limits (incr p SE) t
  (appendNextInDirection SO limits (incr p SO) t [])))))))

populateColumn : (line : ℕ) (column : ℕ) (seats : List SeatType) → Tree → Tree
populateColumn _ _ [] t = t
populateColumn line column (x ∷ seats) t = populateColumn line (suc (column)) seats (insert (line , column) (x , []) t)

populateLine : (line : ℕ) (seats : List (List SeatType)) → Tree → Tree
populateLine _ [] t = t
populateLine line (x ∷ seats) t = populateLine (suc line) seats (populateColumn line 1 x t)

populate : List (List SeatType) → Tree
populate l = populateLine 1 l empty

createNeighbours : (limit : Pair) → List Pair → Tree → Tree
createNeighbours _ [] t = t
createNeighbours limit (x ∷ l) t with lookup x t
... | nothing = empty
... | just (NOTHING , _) = createNeighbours limit l t
... | just (st , _) = createNeighbours limit l (insert x (st , neighbours2 limit x t) t)

numberOccupied : Tree → List Pair → ℕ
numberOccupied t = foldr (λ p n → case lookup p t of λ {nothing → 0 ; (just (st , _)) → n + (if (does (st ≡? TAKEN)) then 1 else 0)}) 0

update : SeatType → List Pair → Tree → (SeatType × Bool)
update EMPTY l t = case does (numberOccupied t l ≟ 0) of λ {false → EMPTY , false ; true → TAKEN , true}
update NOTHING _ _ = NOTHING , false
update TAKEN l t = case does (numberOccupied t l ≥? 5) of λ {false → TAKEN , false ; true → EMPTY , true}

oneStep : List Pair → Tree → (Tree × Bool)
oneStep [] t = empty , false
oneStep (x ∷ l) t with lookup x t
... | nothing = t , false
... | just (st , els) with update st els t | oneStep l t
... | st' , b | t' , b' = insert x (st' , els) t' , b ∨ b'

{-# TERMINATING #-}
severalSteps : List Pair → Tree → ℕ
severalSteps l t with oneStep l t
... | t' , false = numberOccupied t l
... | t' , true = severalSteps l t'

process : List (List SeatType) → ℕ
process [] = 0
process l@(l₁ ∷ _) =
  let t = populate l in
  let indexes = (mapₗ proj₁) (toList t) in
  severalSteps indexes (createNeighbours (length l , length l₁) indexes t)

main = (run ∘ putStrLn ∘ show) (process input)
