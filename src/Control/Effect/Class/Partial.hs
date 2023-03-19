{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE ScopedTypeVariables #-}
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
import Prelude ((.), pure)
import Control.Monad
import Data.Void (absurd, Void)
import Control.Monad.Effects.Helper


-- | This class is used to prove that the
-- functor `m` can produce nullary values.
-- e.g:
-- ```instance Partial Maybe where
--        partial = Nothing
--        attempt = maybe (Left partial) Right
-- ```
class 
    (Monad m) 
    => Partial m 
  where
    partial :: m Void
    attempt :: m ~> Either (m Void)


-- | Like a `Nothing` in the `Maybe` monad or an empty 
-- list in the list type.
nil :: (Partial m) => m a
{-# INLINE nil #-}
nil = 
    fmap absurd partial


recover :: (Partial m) => (m Void -> m a) -> (m a -> m a)
{-# INLINE recover #-}
recover f =
    either f pure . attempt
