{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module Control.Effect.Class.Unpair
    ( Unpair(..)
    , pair
    )
where


class Unpair m where
    unpair :: m (a, b) -> (m a, m b)


-- | Pairing/product is implied by the Monad instance.
pair :: (Monad m) => (m a, m b) -> m (a, b)
pair (ma, mb) = do
   a <- ma
   b <- mb
   return (a, b)


foo :: (a -> m b) -> m a -> m (a, m b)
foo = undefined
