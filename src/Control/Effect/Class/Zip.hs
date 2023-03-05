{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module Control.Effect.Class.Zip
    ()
where


import Control.Exception (Exception,SomeException)
import Data.Void (Void, absurd)


class Product m where
    both :: m a -> m b -> m (a, b)
    each :: m (a, b) -> (m a, m b)

