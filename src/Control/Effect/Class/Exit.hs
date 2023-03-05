module Control.Effect.Class.Exit
    ( Exit(..)
    ) 
where


class Exit m where
    exitWithSuccess :: m a -> m a
    exitWithFailure :: Int -> (m a -> m a)
