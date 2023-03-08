{-# LANGUAGE ImplicitParams #-}
module Control.Effect.Class.Time 
    ( Time(..)
    , withStaticTime
    , setTime
    , initial
    , current
    , elapsed
    ) 
where

import Data.Time


class Time m where
    withTime :: (HasTime m => m a) -> m a


initial :: (HasTime m, Applicative m) => m UTCTime
initial = 
    pure (fst ?timeEnv)


current :: (HasTime m) => m UTCTime 
current = 
    snd ?timeEnv


elapsed :: (HasTime m, Monad m) => m NominalDiffTime
elapsed = 
    initial >>= \t0 -> diffUTCTime t0 <$> current 


-- | Helper used to define a `withTime` function in the
-- `Time` class instantiation.
setTime 
    :: (Monad m) 
    => m UTCTime -> (HasTime m => m ()) -> m ()
setTime getTime go = do
    t0 <- getTime 
    let ?timeEnv = (t0, getTime)
    go


-- | Both `initial` and `current` will return the same time in this code block.
withStaticTime :: forall m a. (Time m, Monad m) => (HasTime m => m a) -> m a
withStaticTime ma =
    withTime $ do
        t0 <- initial 
        let staticTime = pure t0 :: m UTCTime 
        let ?timeEnv = (t0, staticTime)
        ma


-----------------------------------------------------------
-- PRIVATE ------------------------------------------------
-----------------------------------------------------------


type HasTime m = ?timeEnv :: (UTCTime, m UTCTime)
