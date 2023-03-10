module Control.Effect.Class.Store 
where


-- | Similar to state, but parametized/indexed by a key.
class Store key s m where
    store :: key -> (s -> m a) -> m a
    fetch :: key -> m a -> (s -> m a)
