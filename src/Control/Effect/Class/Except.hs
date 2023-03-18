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


import Prelude (id, (.))
import Data.Either
import Control.Monad
import Control.Exception (Exception,SomeException)
import Data.Void (Void, absurd)


type Fail m = Except SomeException m


class 
    (Monad m, Exception e) 
    => Except e m 
  where
    err :: e -> m Void
    try :: m a -> Either e (m a)


throw :: (Except e m) => e -> m a 
{-# INLINE throw #-}
throw = 
    fmap absurd . err

catch :: (Except e m) => (m e -> m a) -> (m a -> m a)
{-# INLINE catch #-}
catch f ma =
    either f id (try ma)
