module Control.Effect.Class.Join
where


class Join m where
    join :: m (m a) -> m a
