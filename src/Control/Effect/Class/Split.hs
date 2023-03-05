module Control.Effect.Class.Split
where


class Split m where
    split :: m a -> m (m a)
