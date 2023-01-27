module Control.Effect.Class.Input where


class Input i m where
    ingest :: m i

ingests 
    :: ( Monad m
       , Input i m
       ) 
    => (i -> a) 
    -> m a
ingests f = 
    ingest >>= f


ingestN :: (Integral n, Input i m) => n -> m [i]
ingestN n = undefined


-- local cannot be defined without access to the interpreter medium
