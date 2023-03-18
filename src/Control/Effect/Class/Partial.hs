{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Partial 
    ( Partial(..)
    , nil
    , recover
    , Void
    )
where

import Data.Either
import Data.Functor
import Prelude (id)
import Control.Monad (Monad)
import Data.Void (absurd, Void)


-- | This class is used to prove that the
-- functor `m` can produce nullary values.
-- E.g: the partial value for `Maybe` is `Nothing`.
class 
    (Monad m) 
    => Partial m 
  where
    partial :: m Void
    attempt :: m a -> Either (m Void) (m a)


-- | Like a `Nothing` in the `Maybe` monad or an empty 
-- list in the list type.
nil :: (Partial m) => m a
{-# INLINE nil #-}
nil = fmap absurd partial


recover :: (Partial m) => (m Void -> m a) -> (m a -> m a)
{-# INLINE recover #-}
recover f ma =
    either f id (attempt ma)
