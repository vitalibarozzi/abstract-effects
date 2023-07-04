{-# LANGUAGE ImpredicativeTypes #-}
module Control.Effect.Class.Time 
    ( Time(..)
    , Timer(..)
    , elapsed
    , module Data.Time
    ) 
where

import Prelude
import Data.Time
import Data.Kind


class (Monad m) => Time m where
    now :: m UTCTime


class (Monad m) => Timer m where
    withTimer :: (Timed m => m a) -> m a


type Timed (m::Type->Type) = ?_t0 :: UTCTime


elapsed :: (Time m) => (Timed m => m NominalDiffTime)
elapsed = do
    t1 <- now
    undefined -- pure (addUTCTime (t1 - ?_t0))




