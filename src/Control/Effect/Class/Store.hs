module Control.Effect.Class.Store 
where

import Control.Monad


class Store ix a m where
    store :: ix -> (a -> m ())
    fetch :: ix -> m a



class Lolwhat k m where
    lolwhat :: m (k m)


-- wtf
class Introspect k m where
    introspect :: m (rec k) -> k (rec m) 
