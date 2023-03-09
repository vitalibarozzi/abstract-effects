{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
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
import Data.Kind


class Time m where
    withTime :: ((HasTime m) => m a) -> m a
    withTimeout :: NominalDiffTime -> ((HasTime m) => m a) -> m a


initial :: (HasTime m, Applicative m) => m UTCTime
initial = 
    let (initial_, _, _) = ?timeEnv 
    in pure initial_


current :: (HasTime m) => m UTCTime 
current = 
    let (_, current_, _) = ?timeEnv 
    in current_


elapsed :: (HasTime m, Monad m) => m NominalDiffTime
elapsed = 
    initial >>= \t0 -> diffUTCTime t0 <$> current 


remaining :: (HasTime m, Monad m) => m NominalDiffTime
remaining =  -- TODO
    let (_, current_, hasTimelimit) = ?timeEnv 
    in undefined current_ hasTimelimit -- TODO


-- | Helper used to define a `withTime` function in the
-- `Time` class instantiation, not to be used directly.
setTime 
    :: (Monad m) 
    => m UTCTime -> (HasTime m => m ()) -> m ()
setTime getTime go = do
    t0 <- getTime 
    let ?timeEnv = (t0, getTime, Nothing)
    go


--setTimeout
--    :: (Time m) 
--    => NominalDiffTime -> (HasTime m => m ()) -> m ()
--setTimeout timeLimit go = do
--    withTime $ do
--        let (t0, getTime, _) = ?timeEnv 
--        let ?timeEnv = (t0, getTime, Just (undefined timeLimit)) -- TODO
--        go


-- | Both `initial` and `current` will return the same time in this code block,
-- which in turns makes `elapsed` always be zero.
withStaticTime :: forall m a. (Time m, Monad m) => (HasTime m => m a) -> m a
withStaticTime ma =
    withTime $ do
        t0 <- initial 
        let staticTime = pure t0 :: m UTCTime 
        let ?timeEnv = (t0, staticTime, undefined)
        ma


-----------------------------------------------------------
-- PRIVATE ------------------------------------------------
-----------------------------------------------------------


type HasTime m = ?timeEnv :: (UTCTime, m UTCTime, Maybe UTCTime)
