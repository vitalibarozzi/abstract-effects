{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module Control.Effect.Class.Product
    ( Product(..)
    )
where


class Product m where
    both :: m a -> m b -> m (a, b)
    each :: m (a, b) -> (m a, m b)

