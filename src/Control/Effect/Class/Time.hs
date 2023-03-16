{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
module Control.Effect.Class.Time 
    ( Time(..)
    ) 
where

import Data.Time
import Data.Kind


data TimeContext m = TimeContext
    { initialTime :: UTCTime
    , currentTime :: m UTCTime
    , timeoutTime :: Maybe UTCTime
    , subTime     :: Maybe LocalTimeContext
    }


data LocalTimeContext = LocalTimeContext
    { subInitialTime :: NominalDiffTime
    , subCurrentTime :: NominalDiffTime
    , subTimeoutTime :: Maybe NominalDiffTime
    , subSubTime     :: Maybe LocalTimeContext
    }


-- TODO move the functionality out of the implicit params and make it abstract with methods in the class, if so
class (Monad m) => Time m where
    timeContext :: TimeContext m
    withLocalTime :: (LocalTimeContext -> m a) -> m a
    withTimeout :: Int -> m a -> (m a -> m a)


startedAt :: (Time m) => m UTCTime
{-# INLINE startedAt #-}
startedAt = undefined -- withLocalTime (pure . subInitialTime)


endingAt :: (Time m) => m (Maybe UTCTime)
{-# INLINE endingAt #-}
endingAt = undefined -- withTimeContext (pure . timeoutTime)


now :: (Time m) => m UTCTime
{-# INLINE now #-}
now = undefined -- withTimeContext currentTime


elapsed :: m NominalDiffTime
{-# INLINE elapsed #-}
elapsed = undefined


remaining :: m NominalDiffTime
{-# INLINE remaining #-}
remaining = undefined










{-
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
-}
