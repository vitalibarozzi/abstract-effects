{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Exception 
    ( Error(..)
    , Exception
    , throw
    ) 
where


import Control.Exception hiding (throw)
import Data.Void (Void, absurd)


class Error e m where
    throwVoid :: (Exception e) => e -> m Void


throw :: (Error e m, Exception e, Functor m) => e -> m a 
{-# INLINE throw #-}
throw e = fmap absurd (throwVoid e)
