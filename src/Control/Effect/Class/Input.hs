{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Input 
    ( Input(..)
    ) 
where


class Input i m where
    input :: m i
