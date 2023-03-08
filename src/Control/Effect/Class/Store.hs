module Control.Effect.Class.Store 
where


class Store key s m where
    store :: key -> (forall a. (s -> m a) -> m a)
    fetch :: key -> (forall a. m a -> (s -> m a))


class Lolwhat k m where
    lolwhat :: m (k m)


-- wtf
class Introspect k m where
    introspect :: m (rec k) -> k (rec m) 
