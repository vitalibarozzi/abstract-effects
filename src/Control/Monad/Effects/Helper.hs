{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE UndecidableSuperClasses #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE RankNTypes #-}
module Control.Monad.Effects.Helper where


type (~>) f g = ∀ a. (f a -> g a)


-------------------------------------------
-- ideas
-------------------------------------------


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
