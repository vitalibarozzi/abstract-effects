{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Random 
    ( Random(..)
    )
where


-- | Name chose for been more casual than Non-Det.
class Random a m where
    random :: m a
