{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Agda.Builtin.Float where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

name6 = "Agda.Builtin.Float.Float"
type T6 = Double
d6
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Float.Float"
name8 = "Agda.Builtin.Float.primFloatToWord64"
d8 = MAlonzo.RTE.doubleToWord64
name10 = "Agda.Builtin.Float.primFloatEquality"
d10 = MAlonzo.RTE.eqFloat
name12 = "Agda.Builtin.Float.primFloatLess"
d12 = MAlonzo.RTE.ltFloat
name14 = "Agda.Builtin.Float.primFloatNumericalEquality"
d14 = MAlonzo.RTE.eqNumFloat
name16 = "Agda.Builtin.Float.primFloatNumericalLess"
d16 = MAlonzo.RTE.ltNumFloat
name18 = "Agda.Builtin.Float.primNatToFloat"
d18 = (fromIntegral :: Integer -> Double)
name20 = "Agda.Builtin.Float.primFloatPlus"
d20 = ((+)          :: Double -> Double -> Double)
name22 = "Agda.Builtin.Float.primFloatMinus"
d22 = ((-)          :: Double -> Double -> Double)
name24 = "Agda.Builtin.Float.primFloatTimes"
d24 = ((*)          :: Double -> Double -> Double)
name26 = "Agda.Builtin.Float.primFloatNegate"
d26 = (negate       :: Double -> Double)
name28 = "Agda.Builtin.Float.primFloatDiv"
d28 = ((/)          :: Double -> Double -> Double)
name30 = "Agda.Builtin.Float.primFloatSqrt"
d30 = (sqrt :: Double -> Double)
name32 = "Agda.Builtin.Float.primRound"
d32 = (round . MAlonzo.RTE.normaliseNaN :: Double -> Integer)
name34 = "Agda.Builtin.Float.primFloor"
d34 = (floor . MAlonzo.RTE.normaliseNaN :: Double -> Integer)
name36 = "Agda.Builtin.Float.primCeiling"
d36 = (ceiling . MAlonzo.RTE.normaliseNaN :: Double -> Integer)
name38 = "Agda.Builtin.Float.primExp"
d38 = (exp :: Double -> Double)
name40 = "Agda.Builtin.Float.primLog"
d40 = (log :: Double -> Double)
name42 = "Agda.Builtin.Float.primSin"
d42 = (sin :: Double -> Double)
name44 = "Agda.Builtin.Float.primCos"
d44 = (cos :: Double -> Double)
name46 = "Agda.Builtin.Float.primTan"
d46 = (tan :: Double -> Double)
name48 = "Agda.Builtin.Float.primASin"
d48 = (asin :: Double -> Double)
name50 = "Agda.Builtin.Float.primACos"
d50 = (acos :: Double -> Double)
name52 = "Agda.Builtin.Float.primATan"
d52 = (atan :: Double -> Double)
name54 = "Agda.Builtin.Float.primATan2"
d54 = (atan2 :: Double -> Double -> Double)
name56 = "Agda.Builtin.Float.primShowFloat"
d56 = (Data.Text.pack . show :: Double -> Data.Text.Text)
