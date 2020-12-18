{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Induction.WellFounded where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Induction

name22 = "Induction.WellFounded.WfRec"
d22 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  MAlonzo.Code.Agda.Primitive.T4 -> (AgdaAny -> ()) -> AgdaAny -> ()
d22 = erased
name42 = "Induction.WellFounded.Acc"
d42 a0 a1 a2 a3 a4 = ()
data T42 = C52
name62 = "Induction.WellFounded.acc-inverse"
d62 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny -> T42 -> AgdaAny -> AgdaAny -> T42
d62 = erased
name70 = "Induction.WellFounded.WellFounded"
d70 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 -> (AgdaAny -> AgdaAny -> ()) -> ()
d70 = erased
name76 = "Induction.WellFounded.Well-founded"
d76 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 -> (AgdaAny -> AgdaAny -> ()) -> ()
d76 = erased
name82 = "Induction.WellFounded.Acc-resp-≈"
d82 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny -> T42 -> T42
d82 = erased
name106 = "Induction.WellFounded.Some.wfRecBuilder"
d106 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> T42 -> AgdaAny -> AgdaAny -> AgdaAny
d106 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 = du106 v6 v9
du106 ::
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny
du106 v0 v1 = coe v0 v1 (\ v2 v3 -> coe du106 (coe v0) v2)
name120 = "Induction.WellFounded.Some.wfRec"
d120 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> T42 -> AgdaAny
d120 v0 v1 v2 v3 v4 = du120
du120 ::
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> T42 -> AgdaAny
du120
  = coe
      MAlonzo.Code.Induction.du114
      (\ v0 v1 v2 v3 v4 v5 -> coe du106 v1 v4)
name134 = "Induction.WellFounded.Some.unfold-wfRec"
d134 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> T42 -> MAlonzo.Code.Agda.Builtin.Equality.T12
d134 = erased
name142 = "Induction.WellFounded.Some.wfRec-builder"
d142 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> T42 -> AgdaAny -> AgdaAny -> AgdaAny
d142 v0 v1 v2 v3 v4 = du142
du142 ::
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> T42 -> AgdaAny -> AgdaAny -> AgdaAny
du142 v0 v1 v2 v3 v4 v5 = coe du106 v1 v4
name156 = "Induction.WellFounded.All.wfRecBuilder"
d156 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d156 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du156 v7
du156 ::
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny
du156 v0 v1 v2 = coe du106 (coe v0) v1
name164 = "Induction.WellFounded.All.wfRec"
d164 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny
d164 v0 v1 v2 v3 v4 v5 = du164
du164 ::
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny
du164
  = coe MAlonzo.Code.Induction.du54 (\ v0 v1 v2 -> coe du156 v1)
name166 = "Induction.WellFounded.All.wfRec-builder"
d166 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d166 v0 v1 v2 v3 v4 v5 = du166
du166 ::
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du166 v0 v1 v2 = coe du156 v1
name202 = "Induction.WellFounded.FixPoint.some-wfRec-irrelevant"
d202 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  (AgdaAny ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
   MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  AgdaAny -> T42 -> T42 -> MAlonzo.Code.Agda.Builtin.Equality.T12
d202 = erased
name224 = "Induction.WellFounded.FixPoint._.wfRec"
d224 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  (AgdaAny ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
   MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny
d224 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du224
du224 ::
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny
du224 = coe du164
name226 = "Induction.WellFounded.FixPoint._.wfRec-builder"
d226 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  (AgdaAny ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
   MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d226 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du226
du226 ::
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du226 = coe du166
name228 = "Induction.WellFounded.FixPoint._.wfRecBuilder"
d228 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  (AgdaAny ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
   MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d228 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du228
du228 ::
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du228 v0 v1 v2 = coe du156 v1
name236 = "Induction.WellFounded.FixPoint.wfRecBuilder-wfRec"
d236 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  (AgdaAny ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
   MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d236 = erased
name262 = "Induction.WellFounded.FixPoint.unfold-wfRec"
d262 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  (AgdaAny -> ()) ->
  (AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny) ->
  (AgdaAny ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> AgdaAny) ->
   (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
   MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d262 = erased
name284 = "Induction.WellFounded.Subrelation.accessible"
d284 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> T42 -> T42
d284 = erased
name292 = "Induction.WellFounded.Subrelation.wellFounded"
d292 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> T42) -> AgdaAny -> T42
d292 = erased
name298 = "Induction.WellFounded.Subrelation.well-founded"
d298 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> T42) -> AgdaAny -> T42
d298 = erased
name314 = "Induction.WellFounded.InverseImage.accessible"
d314 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> T42 -> T42
d314 = erased
name322 = "Induction.WellFounded.InverseImage.wellFounded"
d322 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> T42) -> AgdaAny -> T42
d322 = erased
name328 = "Induction.WellFounded.InverseImage.well-founded"
d328 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> T42) -> AgdaAny -> T42
d328 = erased
name340 = "Induction.WellFounded.TransitiveClosure._<⁺_"
d340 a0 a1 a2 a3 a4 a5 = ()
data T340 = C348 AgdaAny | C360 AgdaAny T340 T340
name366 = "Induction.WellFounded.TransitiveClosure.downwardsClosed"
d366 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny -> AgdaAny -> T42 -> T340 -> T42
d366 = erased
name378 = "Induction.WellFounded.TransitiveClosure.accessible"
d378 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny -> ()) -> AgdaAny -> T42 -> T42
d378 = erased
name382 = "Induction.WellFounded.TransitiveClosure.accessible′"
d382 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny -> T42 -> AgdaAny -> T340 -> T42
d382 = erased
name400 = "Induction.WellFounded.TransitiveClosure.wellFounded"
d400 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> T42) -> AgdaAny -> T42
d400 = erased
name406
  = "Induction.WellFounded.TransitiveClosure.downwards-closed"
d406 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny -> AgdaAny -> T42 -> T340 -> T42
d406 = erased
name408 = "Induction.WellFounded.TransitiveClosure.well-founded"
d408 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> T42) -> AgdaAny -> T42
d408 = erased
name430 = "Induction.WellFounded.Lexicographic._<_"
d430 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 = ()
data T430 = C442 AgdaAny | C452 AgdaAny
name460 = "Induction.WellFounded.Lexicographic.accessible"
d460 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> ()) ->
  AgdaAny -> AgdaAny -> T42 -> (AgdaAny -> AgdaAny -> T42) -> T42
d460 = erased
name468 = "Induction.WellFounded.Lexicographic.accessible′"
d468 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  AgdaAny ->
  T42 ->
  T42 ->
  (AgdaAny -> AgdaAny -> T42) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> T430 -> T42
d468 = erased
name490 = "Induction.WellFounded.Lexicographic.wellFounded"
d490 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  (AgdaAny -> AgdaAny -> T42) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> T42
d490 = erased
name498 = "Induction.WellFounded.Lexicographic.well-founded"
d498 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> T42) ->
  (AgdaAny -> AgdaAny -> T42) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> T42
d498 = erased
name502 = "Induction.WellFounded.Inverse-image.accessible"
d502 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> T42 -> T42
d502 = erased
name504 = "Induction.WellFounded.Inverse-image.well-founded"
d504 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> T42) -> AgdaAny -> T42
d504 = erased
name506 = "Induction.WellFounded.Inverse-image.wellFounded"
d506 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> T42) -> AgdaAny -> T42
d506 = erased
name510 = "Induction.WellFounded.Transitive-closure._<⁺_"
d510 a0 a1 a2 a3 a4 a5 = ()
name514 = "Induction.WellFounded.Transitive-closure.accessible"
d514 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny -> ()) -> AgdaAny -> T42 -> T42
d514 = erased
name516 = "Induction.WellFounded.Transitive-closure.accessible′"
d516 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny -> T42 -> AgdaAny -> T340 -> T42
d516 = erased
name518
  = "Induction.WellFounded.Transitive-closure.downwards-closed"
d518 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny -> AgdaAny -> T42 -> T340 -> T42
d518 = erased
name520
  = "Induction.WellFounded.Transitive-closure.downwardsClosed"
d520 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny -> AgdaAny -> T42 -> T340 -> T42
d520 = erased
name524 = "Induction.WellFounded.Transitive-closure.well-founded"
d524 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> T42) -> AgdaAny -> T42
d524 = erased
name526 = "Induction.WellFounded.Transitive-closure.wellFounded"
d526 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> T42) -> AgdaAny -> T42
d526 = erased
