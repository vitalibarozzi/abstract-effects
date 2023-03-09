{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Random 
    ( Random(..)
    )
where


class Random a m where
    random :: m a
