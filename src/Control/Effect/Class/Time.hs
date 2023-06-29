{-# LANGUAGE ImpredicativeTypes #-}
module Control.Effect.Class.Terminal 
    ( Time(..)
    , Timer(..)
    , elapsed
    , module Data.Time
    ) 
where


import Data.Time


class (Monad m) => Time m where
    now :: m UTCTime


class (Monad m) => Timer m where
    withTimer :: (Timed m => m a) -> m a


type Timed m = ?_t0 :: UTCTime


elapsed :: (Time m) => (Timed m => m NominalDiffTime)
elapsed = do
    t1 <- now
    pure (addUTCTime (t1 - ?_t0))




