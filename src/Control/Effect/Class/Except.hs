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


class 
    (Monad m, Exception e) 
    => Except e m 
  where
    err :: m e -> m Void
    try :: m a -> Either (m e) (m a) -- TODO this make this class not algebraic, i guess?


throw :: (Except e m) => e -> m a 
{-# INLINE throw #-}
throw = 
    undefined -- fmap absurd . err


catch :: (Except e m) => (m e -> m a) -> (m a -> m a)
{-# INLINE catch #-}
catch f ma =
    either f id (try ma)
