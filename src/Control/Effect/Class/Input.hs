{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Input 
    ( Input(..)
    , withInput
    ) 
where


class Input i m where
    ingest :: m i


withInput 
    :: ( Monad m
       , Input i m
       ) 
    => (i -> m a) 
    -> m a
withInput f = 
    ingest >>= f
