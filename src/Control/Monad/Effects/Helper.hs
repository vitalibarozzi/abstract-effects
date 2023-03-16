{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE ExplicitNamespaces #-}
module Control.Monad.Effects.Helpers (type (~>)) where

import Prelude

-- these are probably not useful in here, where the functor is always the same

type (~>) f g = ∀a. (f a -> g a)

-- TODO ?
class Effectful k m | m -> k where
    subsume :: (k m => m a) -> m a
    expose :: m a -> (k m => m a)

class (==>) k l where
    idk :: ∀m a. (k m => m a) -> (l m => m a)

instance k ==> l where
    idk _ = undefined

instance Monad ==> Functor where
    idk _ = undefined

-- TODO
type (=~>) k l = ∀m a. (k m => m a) -> (l m => m a)


foo :: Monad m => m Bool
foo = undefined


qux :: Monad ==> Functor => Monad =~> Functor
qux = idk


bar :: Monad ==> Functor => Functor m => m Bool
bar = qux foo
