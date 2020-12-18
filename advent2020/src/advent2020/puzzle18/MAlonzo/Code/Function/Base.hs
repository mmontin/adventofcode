{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Function.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive

name24 = "Function.Base.id"
d24 :: MAlonzo.Code.Agda.Primitive.T4 -> () -> AgdaAny -> AgdaAny
d24 v0 v1 v2 = du24 v2
du24 :: AgdaAny -> AgdaAny
du24 v0 = coe v0
name28 = "Function.Base.const"
d28 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> AgdaAny -> AgdaAny
d28 v0 v1 v2 v3 v4 v5 = du28 v4
du28 :: AgdaAny -> AgdaAny
du28 v0 = coe v0
name34 = "Function.Base.constᵣ"
d34 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> AgdaAny -> AgdaAny
d34 v0 v1 v2 v3 v4 v5 = du34 v5
du34 :: AgdaAny -> AgdaAny
du34 v0 = coe v0
name54 = "Function.Base._∘_"
d54 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d54 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du54 v6 v7 v8
du54 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du54 v0 v1 v2 = coe v0 v2 (coe v1 v2)
name92 = "Function.Base._∘₂_"
d92 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d92 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 = du92 v8 v9 v10 v11
du92 ::
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du92 v0 v1 v2 v3 = coe v0 v2 v3 (coe v1 v2 v3)
name116 = "Function.Base.flip"
d116 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d116 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du116 v6 v7 v8
du116 ::
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du116 v0 v1 v2 = coe v0 v2 v1
name132 = "Function.Base._$_"
d132 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> ()) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d132 v0 v1 v2 v3 v4 v5 = du132 v4 v5
du132 :: (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du132 v0 v1 = coe v0 v1
name146 = "Function.Base._$!_"
d146 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> ()) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d146 v0 v1 v2 v3 v4 v5 = du146 v4 v5
du146 :: (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du146 v0 v1 = coe seq (coe v1) (coe v0 v1)
name156 = "Function.Base._|>_"
d156 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> ()) -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d156 v0 v1 v2 v3 v4 v5 = du156 v4 v5
du156 :: AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du156 v0 v1 = coe v1 v0
name176 = "Function.Base._ˢ_"
d176 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d176 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du176 v6 v7 v8
du176 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du176 v0 v1 v2 = coe v0 v2 (coe v1 v2)
name192 = "Function.Base._$-"
d192 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> ()) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d192 v0 v1 v2 v3 v4 v5 = du192 v4 v5
du192 :: (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du192 v0 v1 = coe v0 v1
name204 = "Function.Base.λ-"
d204 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> ()) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d204 v0 v1 v2 v3 v4 v5 = du204 v4 v5
du204 :: (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du204 v0 v1 = coe v0 v1
name218 = "Function.Base.case_return_of_"
d218 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> (AgdaAny -> ()) -> (AgdaAny -> AgdaAny) -> AgdaAny
d218 v0 v1 v2 v3 v4 v5 = du218 v3 v5
du218 :: AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du218 v0 v1 = coe v1 v0
name226 = "Function.Base._∘′_"
d226 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d226 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du226 v6 v7 v8
du226 ::
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du226 v0 v1 v2 = coe v0 (coe v1 v2)
name232 = "Function.Base._∘₂′_"
d232 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d232 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 = du232 v8 v9 v10 v11
du232 ::
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du232 v0 v1 v2 v3 = coe v0 (coe v1 v2 v3)
name238 = "Function.Base._$′_"
d238 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d238 v0 v1 v2 v3 v4 = du238 v4
du238 :: (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du238 v0 = coe v0
name240 = "Function.Base._$!′_"
d240 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d240 v0 v1 v2 v3 = du240
du240 :: (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du240 = coe du146
name242 = "Function.Base._|>′_"
d242 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d242 v0 v1 v2 v3 v4 v5 = du242 v4 v5
du242 :: AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du242 v0 v1 = coe v1 v0
name244 = "Function.Base.case_of_"
d244 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d244 v0 v1 v2 v3 v4 v5 = du244 v4 v5
du244 :: AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du244 v0 v1 = coe v1 v0
name250 = "Function.Base._⟨_⟩_"
d250 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d250 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du250 v6 v7 v8
du250 ::
  AgdaAny -> (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du250 v0 v1 v2 = coe v1 v0 v2
name260 = "Function.Base._∋_"
d260 :: MAlonzo.Code.Agda.Primitive.T4 -> () -> AgdaAny -> AgdaAny
d260 v0 v1 v2 = du260 v2
du260 :: AgdaAny -> AgdaAny
du260 v0 = coe v0
name268 = "Function.Base.typeOf"
d268 :: MAlonzo.Code.Agda.Primitive.T4 -> () -> AgdaAny -> ()
d268 = erased
name274 = "Function.Base.it"
d274 :: MAlonzo.Code.Agda.Primitive.T4 -> () -> AgdaAny -> AgdaAny
d274 v0 v1 v2 = du274 v2
du274 :: AgdaAny -> AgdaAny
du274 v0 = coe v0
name278 = "Function.Base._-⟪_⟫-_"
d278 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d278 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
  = du278 v10 v11 v12 v13 v14
du278 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du278 v0 v1 v2 v3 v4 = coe v1 (coe v0 v3 v4) (coe v2 v3 v4)
name290 = "Function.Base._-⟪_∣"
d290 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d290 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 = du290 v8 v9 v10 v11
du290 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du290 v0 v1 v2 v3 = coe v1 (coe v0 v2 v3) v3
name296 = "Function.Base.∣_⟫-_"
d296 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d296 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 = du296 v8 v9 v10 v11
du296 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du296 v0 v1 v2 v3 = coe v0 v2 (coe v1 v2 v3)
name302 = "Function.Base._-⟨_∣"
d302 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d302 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 = du302 v8 v9 v10
du302 ::
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du302 v0 v1 v2 = coe v1 (coe v0 v2)
name308 = "Function.Base.∣_⟩-_"
d308 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d308 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 = du308 v8 v9 v10 v11
du308 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du308 v0 v1 v2 v3 = coe v0 v2 (coe v1 v3)
name314 = "Function.Base._-⟪_⟩-_"
d314 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d314 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
  = du314 v10 v11 v12 v13 v14
du314 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du314 v0 v1 v2 v3 v4 = coe v1 (coe v0 v3 v4) (coe v2 v4)
name322 = "Function.Base._-⟨_⟫-_"
d322 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d322 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
  = du322 v10 v11 v12 v13 v14
du322 ::
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du322 v0 v1 v2 v3 v4 = coe v1 (coe v0 v3) (coe v2 v3 v4)
name330 = "Function.Base._-⟨_⟩-_"
d330 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d330 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
  = du330 v10 v11 v12 v13 v14
du330 ::
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du330 v0 v1 v2 v3 v4 = coe v1 (coe v0 v3) (coe v2 v4)
name338 = "Function.Base._on₂_"
d338 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d338 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 = du338 v8 v9 v10 v11
du338 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du338 v0 v1 v2 v3 = coe v0 (coe v1 v2 v3) (coe v1 v2 v3)
name344 = "Function.Base._on_"
d344 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d344 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du344 v6 v7 v8 v9
du344 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du344 v0 v1 v2 v3 = coe v0 (coe v1 v2) (coe v1 v3)
name350 = "Function.Base._-[_]-_"
d350 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
d350 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
  = du350 v10 v11 v12 v13 v14
du350 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> AgdaAny
du350 v0 v1 v2 v3 v4 = coe v1 (coe v0 v3 v4) (coe v2 v3 v4)
