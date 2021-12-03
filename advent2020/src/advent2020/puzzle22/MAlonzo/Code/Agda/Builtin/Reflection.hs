{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Agda.Builtin.Reflection where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Agda.Builtin.Float
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Agda.Primitive

name6 = "Agda.Builtin.Reflection.Name"
d6
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.Name"
name8 = "Agda.Builtin.Reflection.primQNameEquality"
d8
  = (\ x y -> ((==) :: MAlonzo.RTE.QName -> MAlonzo.RTE.QName -> Bool) ( x) ( y))
name10 = "Agda.Builtin.Reflection.primQNameLess"
d10
  = (\ x y -> ((<) :: MAlonzo.RTE.QName -> MAlonzo.RTE.QName -> Bool) ( x) ( y))
name12 = "Agda.Builtin.Reflection.primShowQName"
d12 = Data.Text.pack . MAlonzo.RTE.qnameString
name14 = "Agda.Builtin.Reflection.Associativity"
d14 = ()
type T14 = MAlonzo.RTE.Assoc
pattern C16 = MAlonzo.RTE.LeftAssoc
pattern C18 = MAlonzo.RTE.RightAssoc
pattern C20 = MAlonzo.RTE.NonAssoc
check16 :: T14
check16 = MAlonzo.RTE.LeftAssoc
check18 :: T14
check18 = MAlonzo.RTE.RightAssoc
check20 :: T14
check20 = MAlonzo.RTE.NonAssoc
cover14 :: MAlonzo.RTE.Assoc -> ()
cover14 x
  = case x of
      MAlonzo.RTE.LeftAssoc -> ()
      MAlonzo.RTE.RightAssoc -> ()
      MAlonzo.RTE.NonAssoc -> ()
name22 = "Agda.Builtin.Reflection.Precedence"
d22 = ()
type T22 = MAlonzo.RTE.Precedence
pattern C24 a0 = MAlonzo.RTE.Related a0
pattern C26 = MAlonzo.RTE.Unrelated
check24 :: MAlonzo.Code.Agda.Builtin.Float.T6 -> T22
check24 = MAlonzo.RTE.Related
check26 :: T22
check26 = MAlonzo.RTE.Unrelated
cover22 :: MAlonzo.RTE.Precedence -> ()
cover22 x
  = case x of
      MAlonzo.RTE.Related _ -> ()
      MAlonzo.RTE.Unrelated -> ()
name28 = "Agda.Builtin.Reflection.Fixity"
d28 = ()
type T28 = MAlonzo.RTE.Fixity
pattern C30 a0 a1 = MAlonzo.RTE.Fixity a0 a1
check30 :: T14 -> T22 -> T28
check30 = MAlonzo.RTE.Fixity
cover28 :: MAlonzo.RTE.Fixity -> ()
cover28 x
  = case x of
      MAlonzo.RTE.Fixity _ _ -> ()
name32 = "Agda.Builtin.Reflection.primQNameFixity"
d32 = MAlonzo.RTE.qnameFixity
name36 = "Agda.Builtin.Reflection.primQNameToWord64s"
d36 = \ qn -> (MAlonzo.RTE.nameId qn, MAlonzo.RTE.moduleId qn)
name38 = "Agda.Builtin.Reflection.Meta"
d38
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.Meta"
name40 = "Agda.Builtin.Reflection.primMetaEquality"
d40 = (\ x y -> ((==) :: Integer -> Integer -> Bool) ( x) ( y))
name42 = "Agda.Builtin.Reflection.primMetaLess"
d42 = (\ x y -> ((<) :: Integer -> Integer -> Bool) ( x) ( y))
name44 = "Agda.Builtin.Reflection.primShowMeta"
d44 = \ x -> Data.Text.pack ("_" ++ show (x :: Integer))
name46 = "Agda.Builtin.Reflection.primMetaToNat"
d46 = (id :: Integer -> Integer)
name48 = "Agda.Builtin.Reflection.Visibility"
d48 = ()
data T48 = C50 | C52 | C54
name56 = "Agda.Builtin.Reflection.Relevance"
d56 = ()
data T56 = C58 | C60
name62 = "Agda.Builtin.Reflection.ArgInfo"
d62 = ()
data T62 = C68 T48 T56
name74 = "Agda.Builtin.Reflection.Arg"
d74 a0 a1 = ()
data T74 = C84 T62 AgdaAny
name90 = "Agda.Builtin.Reflection.Abs"
d90 a0 a1 = ()
data T90 = C100 MAlonzo.Code.Agda.Builtin.String.T6 AgdaAny
name102 = "Agda.Builtin.Reflection.Literal"
d102 = ()
data T102
  = C106 Integer | C110 MAlonzo.RTE.Word64 |
    C114 MAlonzo.Code.Agda.Builtin.Float.T6 |
    C118 MAlonzo.Code.Agda.Builtin.Char.T6 |
    C122 MAlonzo.Code.Agda.Builtin.String.T6 | C126 AgdaAny |
    C130 AgdaAny
name132 = "Agda.Builtin.Reflection.Pattern"
d132 = ()
data T132
  = C138 AgdaAny [T74] | C140 |
    C144 MAlonzo.Code.Agda.Builtin.String.T6 | C148 T102 |
    C152 AgdaAny | C154
name156 = "Agda.Builtin.Reflection.Sort"
d156 = ()
data T156 = C216 T160 | C220 Integer | C222
name158 = "Agda.Builtin.Reflection.Clause"
d158 = ()
data T158 = C228 [T74] T160 | C232 [T74]
name160 = "Agda.Builtin.Reflection.Term"
d160 = ()
data T160
  = C168 Integer [T74] | C174 AgdaAny [T74] | C180 AgdaAny [T74] |
    C186 T48 T90 | C192 [T158] [T74] | C198 T74 T90 | C202 T156 |
    C206 T102 | C210 AgdaAny [T74] | C212
name162 = "Agda.Builtin.Reflection.Type"
d162 :: ()
d162 = erased
name234 = "Agda.Builtin.Reflection.Definition"
d234 = ()
data T234
  = C238 [T158] | C244 Integer [AgdaAny] | C250 AgdaAny [T74] |
    C254 AgdaAny | C256 | C258
name260 = "Agda.Builtin.Reflection.ErrorPart"
d260 = ()
data T260
  = C262 MAlonzo.Code.Agda.Builtin.String.T6 | C264 T160 |
    C266 AgdaAny
name270 = "Agda.Builtin.Reflection.TC"
d270
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.TC"
name276 = "Agda.Builtin.Reflection.returnTC"
d276
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.returnTC"
name286 = "Agda.Builtin.Reflection.bindTC"
d286
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.bindTC"
name288 = "Agda.Builtin.Reflection.unify"
d288
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.unify"
name294 = "Agda.Builtin.Reflection.typeError"
d294
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.typeError"
name296 = "Agda.Builtin.Reflection.inferType"
d296
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.inferType"
name298 = "Agda.Builtin.Reflection.checkType"
d298
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.checkType"
name300 = "Agda.Builtin.Reflection.normalise"
d300
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.normalise"
name302 = "Agda.Builtin.Reflection.reduce"
d302
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.reduce"
name308 = "Agda.Builtin.Reflection.catchTC"
d308
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.catchTC"
name314 = "Agda.Builtin.Reflection.quoteTC"
d314
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.quoteTC"
name320 = "Agda.Builtin.Reflection.unquoteTC"
d320
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.unquoteTC"
name322 = "Agda.Builtin.Reflection.getContext"
d322
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.getContext"
name328 = "Agda.Builtin.Reflection.extendContext"
d328
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.extendContext"
name334 = "Agda.Builtin.Reflection.inContext"
d334
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.inContext"
name336 = "Agda.Builtin.Reflection.freshName"
d336
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.freshName"
name338 = "Agda.Builtin.Reflection.declareDef"
d338
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.declareDef"
name340 = "Agda.Builtin.Reflection.declarePostulate"
d340
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.declarePostulate"
name342 = "Agda.Builtin.Reflection.defineFun"
d342
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.defineFun"
name344 = "Agda.Builtin.Reflection.getType"
d344
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.getType"
name346 = "Agda.Builtin.Reflection.getDefinition"
d346
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.getDefinition"
name352 = "Agda.Builtin.Reflection.blockOnMeta"
d352
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.blockOnMeta"
name354 = "Agda.Builtin.Reflection.commitTC"
d354
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.commitTC"
name356 = "Agda.Builtin.Reflection.isMacro"
d356
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.isMacro"
name362 = "Agda.Builtin.Reflection.withNormalisation"
d362
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.withNormalisation"
name364 = "Agda.Builtin.Reflection.debugPrint"
d364
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.debugPrint"
name370 = "Agda.Builtin.Reflection.noConstraints"
d370
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.noConstraints"
name378 = "Agda.Builtin.Reflection.runSpeculative"
d378
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Reflection.runSpeculative"
