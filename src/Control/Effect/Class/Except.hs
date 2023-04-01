{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module Control.Effect.Class.Except
{-
    ( Except(..)
    , Fail
    , throw
    , catch
    -- | Reexport
    , Exception
    ) 
-}
where


import Prelude ((.))
import Data.Either
import Control.Monad
import Control.Applicative
import Control.Exception (Exception,SomeException)
import Data.Void (Void, absurd)


type Error m = Except SomeException m


class 
    (Monad m, Exception e) 
    => Except e m 
  where
    err :: e -> m Void
    try :: m a -> m (Either e a)


throw :: (Except e m) => e -> m a 
{-# INLINE throw #-}
throw = 
    fmap absurd . err


catch :: (Except e m) => (m e -> m a) -> (m a -> m a)
{-# INLINE catch #-}
catch f ma = do
    ea <- try ma
    case ea of
        Left e -> f (pure e)
        Right a -> pure a

