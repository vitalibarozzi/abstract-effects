{-# LANGUAGE ImplicitParams #-}
module Control.Effect.Class.Time 
    ( Time(..)
    , withStaticTime
    , HasTime
    , setTime
    , initial
    , current
    , elapsed
    ) 
where

import Data.Time


class Monad m => Time m where
    withTime :: (HasTime m => m a) -> m a


initial :: (HasTime m, Applicative m) => m UTCTime
initial = pure (fst ?timeEnv)


current :: (HasTime m) => m UTCTime 
current = snd ?timeEnv


elapsed :: (HasTime m, Monad m) => m NominalDiffTime
elapsed = initial >>= \t0 -> diffUTCTime t0 <$> current 


type HasTime m = ?timeEnv :: (UTCTime, m UTCTime)


-- | Helper used to define a `withTime` function in the
-- `Time` instantiation.
setTime :: (Monad m) => m UTCTime -> (HasTime m => m ())
setTime getTime = do
    t0 <- getTime 
    let ?timeEnv = (t0, getTime)
    return ()


-- | Both initial and current will return the same time in this code block.
withStaticTime :: forall m a. (Time m, Monad m) => m a -> (HasTime m => m a)
withStaticTime ma =
    withTime $ do
        t0 <- initial 
        let staticTime = pure t0 :: m UTCTime 
        let ?timeEnv = (t0, staticTime)
        ma
