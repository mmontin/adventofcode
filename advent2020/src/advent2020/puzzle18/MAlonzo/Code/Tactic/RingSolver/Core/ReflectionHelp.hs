{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Data.List.Base
import qualified MAlonzo.Code.Data.Maybe.Base
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Reflection.Term
import qualified MAlonzo.Code.Tactic.RingSolver.Core.NatSet

name14 = "Tactic.RingSolver.Core.ReflectionHelp.hlams"
d14 ::
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d14 v0 v1 v2
  = coe
      MAlonzo.Code.Data.Vec.Base.du374 (coe v0)
      (coe
         (\ v3 v4 v5 ->
            coe
              MAlonzo.Code.Agda.Builtin.Reflection.C186
              (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
              (coe MAlonzo.Code.Agda.Builtin.Reflection.C100 (coe v4) (coe v5))))
      (coe v2) (coe v1)
name26 = "Tactic.RingSolver.Core.ReflectionHelp.vlams"
d26 ::
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d26 v0 v1 v2
  = coe
      MAlonzo.Code.Data.Vec.Base.du374 (coe v0)
      (coe
         (\ v3 v4 v5 ->
            coe
              MAlonzo.Code.Agda.Builtin.Reflection.C186
              (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
              (coe MAlonzo.Code.Agda.Builtin.Reflection.C100 (coe v4) (coe v5))))
      (coe v2) (coe v1)
name36 = "Tactic.RingSolver.Core.ReflectionHelp.getVisible"
d36 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Data.Maybe.Base.T22
d36 v0
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C84 v1 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C68 v3 v4
               -> let v5 = coe MAlonzo.Code.Data.Maybe.Base.C26 in
                  case coe v3 of
                    MAlonzo.Code.Agda.Builtin.Reflection.C50
                      -> case coe v4 of
                           MAlonzo.Code.Agda.Builtin.Reflection.C58
                             -> coe MAlonzo.Code.Data.Maybe.Base.C30 (coe v2)
                           _ -> coe v5
                    _ -> coe v5
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name42 = "Tactic.RingSolver.Core.ReflectionHelp.getArgs"
d42 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Data.Maybe.Base.T22
d42 v0 v1
  = let v2 = coe MAlonzo.Code.Data.Maybe.Base.C26 in
    case coe v1 of
      MAlonzo.Code.Agda.Builtin.Reflection.C180 v3 v4
        -> coe
             MAlonzo.Code.Data.Maybe.Base.du82
             (coe MAlonzo.Code.Data.Vec.Base.du668)
             (coe
                MAlonzo.Code.Data.List.Base.du230 (coe du56) (coe du72)
                (coe MAlonzo.Code.Data.List.Base.du30 (coe d36) (coe v4)) v0)
      _ -> coe v2
name56 = "Tactic.RingSolver.Core.ReflectionHelp._.f"
d56 ::
  Integer ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  Integer -> MAlonzo.Code.Data.Maybe.Base.T22
d56 v0 v1 v2 v3 v4 v5 = du56 v3 v4 v5
du56 ::
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  Integer -> MAlonzo.Code.Data.Maybe.Base.T22
du56 v0 v1 v2
  = case coe v2 of
      0 -> coe
             MAlonzo.Code.Data.Maybe.Base.C30
             (coe MAlonzo.Code.Data.Vec.Base.C28)
      _ -> let v3 = subInt (coe v2) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Data.Maybe.Base.du82
             (coe MAlonzo.Code.Data.Vec.Base.C36 (coe v1)) (coe v0 v3)
name72 = "Tactic.RingSolver.Core.ReflectionHelp._.c"
d72 ::
  Integer ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  Integer -> MAlonzo.Code.Data.Maybe.Base.T22
d72 v0 v1 v2 v3 = du72 v3
du72 :: Integer -> MAlonzo.Code.Data.Maybe.Base.T22
du72 v0
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Data.Maybe.Base.C30
             (coe MAlonzo.Code.Data.Vec.Base.C28)
      _ -> coe MAlonzo.Code.Data.Maybe.Base.C26
name76 = "Tactic.RingSolver.Core.ReflectionHelp.underPi"
d76 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d76
  = coe
      du84
      (coe
         (\ v0 v1 v2 ->
            coe
              MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v0)
              (coe MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v1) (coe v2))))
name84 = "Tactic.RingSolver.Core.ReflectionHelp._.go"
d84 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (Integer ->
   MAlonzo.Code.Data.Vec.Base.T24 ->
   MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d84 v0 v1 v2 v3 = du84 v2 v3
du84 ::
  (Integer ->
   MAlonzo.Code.Data.Vec.Base.T24 ->
   MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
du84 v0 v1
  = let v2
          = coe v0 (0 :: Integer) (coe MAlonzo.Code.Data.Vec.Base.C28) v1 in
    case coe v1 of
      MAlonzo.Code.Agda.Builtin.Reflection.C198 v3 v4
        -> case coe v4 of
             MAlonzo.Code.Agda.Builtin.Reflection.C100 v5 v6
               -> coe
                    du84
                    (coe
                       (\ v7 v8 ->
                          coe
                            v0 (addInt (coe (1 :: Integer)) (coe v7))
                            (coe MAlonzo.Code.Data.Vec.Base.C36 v5 v8)))
                    (coe v6)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> coe v2
name104 = "Tactic.RingSolver.Core.ReflectionHelp.curriedTerm"
d104 :: [Integer] -> MAlonzo.Code.Agda.Builtin.Reflection.T160
d104 v0
  = coe
      MAlonzo.Code.Data.List.Base.du216 (coe d110)
      (coe
         MAlonzo.Code.Agda.Builtin.Reflection.C174
         (coe
            (MAlonzo.RTE.QName
               (28 :: Integer) (3315087417907161601 :: Integer)
               "Data.Vec.Base.Vec.[]"
               (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
         (let v1 = 2 :: Integer in
          let v2 = coe MAlonzo.Code.Agda.Builtin.List.C16 in
          case coe v1 of
            0 -> coe MAlonzo.Code.Agda.Builtin.List.C16
            _ -> let v3 = 1 :: Integer in
                 coe
                   MAlonzo.Code.Agda.Builtin.List.C22
                   (coe
                      MAlonzo.Code.Agda.Builtin.Reflection.C84
                      (coe
                         MAlonzo.Code.Agda.Builtin.Reflection.C68
                         (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                         (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                   (coe MAlonzo.Code.Reflection.Term.d74 (coe v3) (coe v2))))
      (coe MAlonzo.Code.Tactic.RingSolver.Core.NatSet.d204 (coe v0))
name110 = "Tactic.RingSolver.Core.ReflectionHelp._.go"
d110 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d110 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.C174
      (coe
         (MAlonzo.RTE.QName
            (36 :: Integer) (3315087417907161601 :: Integer)
            "Data.Vec.Base.Vec._\8759_"
            (MAlonzo.RTE.Fixity
               MAlonzo.RTE.RightAssoc (MAlonzo.RTE.Related (5.0 :: Double)))))
      (let v2 = 3 :: Integer in
       let v3
             = coe
                 MAlonzo.Code.Agda.Builtin.List.C22
                 (coe
                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                    (coe
                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                    (coe
                       MAlonzo.Code.Agda.Builtin.Reflection.C168 (coe v0)
                       (coe MAlonzo.Code.Agda.Builtin.List.C16)))
                 (coe
                    MAlonzo.Code.Agda.Builtin.List.C22
                    (coe
                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                       (coe
                          MAlonzo.Code.Agda.Builtin.Reflection.C68
                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                       (coe v1))
                    (coe MAlonzo.Code.Agda.Builtin.List.C16)) in
       case coe v2 of
         0 -> coe v3
         _ -> let v4 = 2 :: Integer in
              coe
                MAlonzo.Code.Agda.Builtin.List.C22
                (coe
                   MAlonzo.Code.Agda.Builtin.Reflection.C84
                   (coe
                      MAlonzo.Code.Agda.Builtin.Reflection.C68
                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                (coe MAlonzo.Code.Reflection.Term.d74 (coe v4) (coe v3)))
