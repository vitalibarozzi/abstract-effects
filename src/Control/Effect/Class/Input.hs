module Control.Effect.Class.Input (Input(..), lazyIngest) where


class Input i m where
    ingest :: m i

instance {-# OVERLAPPABLE #-} (Input i m) => Input [i] m where
    ingest = undefined 


withInput 
    :: ( Monad m
       , Input i m
       ) 
    => (i -> m a) 
    -> m a
withInput f = 
    ingest >>= f


lazyIngest :: (Input i m) => m [i]
lazyIngest = undefined


{-





-- local cannot be defined without access to the interpreter medium
-}
