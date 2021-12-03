module Puzzle12 where

open import Puzzle12input

open import Data.Product renaming (map to mapₚ)
open import Data.List
open import Data.Integer hiding (show)
open import Data.Nat using (ℕ ; _∸_ ; zero ; suc) renaming (_+_ to _+ₙ_)
open import Data.Bool hiding (_≟_)
open import Relation.Nullary
open import Function

data Direction : Set where
  N : Direction
  S : Direction
  W : Direction
  E : Direction

data Angle : Set where
  _*90 : ℕ → Angle

Position = ℤ × ℤ

rotate : Position → Angle → Position
rotate (x , y) (zero *90) = x , y
rotate p (suc n *90) with rotate p (n *90)
... | x , y = - y , x

data Instruction : Set where
  Forward : ℕ → Instruction
  Move : ℕ → Direction → Instruction
  Rotate : Angle → Instruction

toAngle : ℕ → Angle
toAngle n = if does (n Data.Nat.≟ 90) then 1 *90 else (if does (n Data.Nat.≟ 180) then 2 *90 else 3 *90)

getInstruction : InstructionRaw → Instruction
getInstruction (N , v) = Move v N
getInstruction (S , v) = Move v S
getInstruction (W , v) = Move v W
getInstruction (E , v) = Move v E
getInstruction (F , v) = Forward v
getInstruction (L , v) = Rotate (toAngle v)
getInstruction (R , v) = Rotate (toAngle (360 ∸ v))

BoatSituation = Position × Position

update : BoatSituation → Instruction → BoatSituation
update ((pbx , pby) , pb@(pwx , pwy)) (Forward x) = (pbx + + x * pwx , pby + + x * pwy) , pb
update (pb , x , y) (Move dy N) = pb , x , y + (+ dy)
update (pb , x , y) (Move dy S) = pb , x , y - (+ dy)
update (pb , x , y) (Move dx W) = pb , x - (+ dx) , y
update (pb , x , y) (Move dx E) = pb , x + (+ dx) , y
update (pb , pw) (Rotate x) = pb , rotate pw x

open import IO
open import Data.Nat.Show

main =
  run $
  putStrLn $
  show $
  uncurry _+ₙ_ $
  mapₚ ∣_∣ ∣_∣ $
  proj₁ $
  foldl update ((+ 0 , + 0) , + 10 , + 1) $
  map getInstruction $
  input

