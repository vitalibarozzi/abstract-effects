module Control.Effect.Class.State where

class State s m where
    get :: m s
    put :: s -> m ()


gets :: (State s m) => (s -> a) -> m a
gets = undefined


modify :: (State s m) => (s -> s) -> m ()
modify = undefined


withState :: (State s m) => (s -> s) -> (m a -> m a)
withState f ma = do
    s <- get
    put (f s)
    a <- ma
    put s
    return a
