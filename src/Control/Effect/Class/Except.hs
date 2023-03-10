{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module Control.Effect.Class.Except
    ( Except(..)
    , Fail
    , throw
    , catch
    -- | Reexport
    , Exception
    ) 
where


import Control.Exception (Exception,SomeException)
import Data.Void (Void, absurd)


type Fail m = Except SomeException m


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
