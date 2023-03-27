{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ImpredicativeTypes #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE UndecidableSuperClasses #-}
{-# LANGUAGE TypeOperators #-}
module Control.Monad.Effects.Helper where

import Prelude
import Data.Kind

type (~>) (f :: Type -> Type) (g :: Type -> Type) = ∀ a. (f a -> g a)



-------------------------------------------
-- ideas
-------------------------------------------

type Functorlike = Type -> Type
type EffectMonad = Effect -> Functorlike
type Effect = Functorlike -> Constraint


class EffectSend (f :: EffectMonad) (g :: EffectMonad) where
    send :: forall k. (f k ~> g k)
class EffectInterpret (f :: EffectMonad) where
    interpret :: forall k. (f k ~> f (Tail k))


class (::*::) k l m
type family Tail (k :: Effect) :: Effect where
    Tail (k ::*:: l) = l
    Tail l           = l

newtype Eff k a = Eff (forall m. (k m) => m a)
newtype Han k a = Han (forall m. (k m) => m a)


instance EffectSend Han Eff where
    send (Han ma) = Eff ma
instance EffectInterpret Eff where
    interpret = fooMap xxx

data ConstraintFn k l
xxx :: ConstraintFn k (Tail k)
xxx = undefined
fooMap :: ConstraintFn k l -> (Eff k a -> Eff l a)
fooMap = undefined

--instance EffectInterpret Eff




{-

bar :: forall k m. (k m => m Bool) -> ()
bar _ = undefined


qux :: ()
qux = bar @Applicative (pure True)

foo :: Effect Applicative => a -> Eff Applicative a
foo a = send (pure a)

class 
    k ::> f 
  where
    internalize' :: ∀ x. (k => x) -> f x
    externalize' :: ∀ x. f x -> (k => x)

class 
    k :::> f 
  where
    internalize'' :: ∀ x. (k x => x) -> f x
    externalize'' :: ∀ x. f x -> (k x => x)

class 
    k :> f 
  where
    internalize :: ∀ x. (k f => f x) -> f x
    externalize :: ∀ x. f x -> (k f => f x)


-- | This is simular to an effect transformation over a monad.
class 
    k ==> l
  where
    (==>) :: ∀ f. ∀ x. (k f => f x) -> (l f => f x)


-- | This is simular to a natural transformation under a constraint.
class 
    f =~> g
 where
    (=~>) :: ∀ k. ∀ x. (k f => f x) -> (k g => g x)
 -}
