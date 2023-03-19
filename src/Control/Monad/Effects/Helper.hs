{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE UndecidableSuperClasses #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE RankNTypes #-}
module Control.Monad.Effects.Helper where
type (~>) f g = ∀a. (f a -> g a)


-------------------------------------------
-- ideas
-------------------------------------------


class 
    k :> f 
  where
    internalize :: ∀x. (k f => f x) -> f x
    externalize :: ∀x. f x -> (k f => f x)


-- | instance (k==>k) f where (==>) fx = fx
class 
    k ==> l
  where
    (==>) :: ∀f. ∀x. (k f => f x) -> (l f => f x)


-- | instance (f=~>f) k where (=~>) fga = fga
class 
    f =~> g
 where
    (=~>) :: ∀k. ∀x. (k f => f x) -> (k g => g x)
