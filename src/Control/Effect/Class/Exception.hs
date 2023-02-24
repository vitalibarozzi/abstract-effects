{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Exception 
    ( Error(..)
    , Exception
    ) 
where


import Control.Exception hiding (throw)


class Error e m where
    throw :: (Exception e) => e -> m a
