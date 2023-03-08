{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module Control.Effect.Class.Except
    ( Except(..)
    , Error
    , Fail
    , fail
    , throw
    , catch
    -- | Reexport
    , Exception
    ) 
where


import Control.Exception (Exception,SomeException)
import Data.Void (Void, absurd)


type Fail = MonadFail
type Error m = Except SomeException m


class (Monad m) => Except e m where
    err :: (Exception e) => e -> m Void
    try :: (Exception e) => m a -> Either (m e) (m a)


throw :: (Except e m, Exception e) => e -> m a 
{-# INLINE throw #-}
throw = 
    fmap absurd . err


catch :: (Except e m, Exception e) => (m e -> m a) -> (m a -> m a)
{-# INLINE catch #-}
catch f ma =
    either f id (try ma)


{-
instance Except e Maybe where 
    {-# INLINE err #-}
    err _ = Nothing
    {-# INLINE try #-}
    try = \case
        Nothing -> Left Nothing
        Just as -> Right (Just as)


instance Except e [] where
    {-# INLINE err #-}
    err _ = []
    {-# INLINE try #-}
    try = \case
        [] -> Left []
        as -> Right as


instance Except e IO where
    {-# INLINE err #-}
    err = throwIO
    {-# INLINE try #-}
    try io = undefined
-}


