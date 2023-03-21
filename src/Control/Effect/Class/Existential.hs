{-# LANGUAGE UnicodeSyntax #-}
module Control.Effect.Class.Existential 
    ( Existential(..)
    ) 
where

import Control.Monad
import Data.Kind


-- | Monads where a value can be delimited in its API
-- by making it existential in relation to a specific constraint
-- that delimits its complete API.
--```
-- instance Delimited Eq m where
--     with cont = cont ()
--
-- instance Delimited Show m where
--     with cont = cont ()
--```
class 
    (Monad f)
    => Existential 
        (c :: Type -> Constraint) 
        (f :: Type -> Type)
  where
    with :: ∀ a. ((∀ x. (c x) => x -> f a) -> f a)
