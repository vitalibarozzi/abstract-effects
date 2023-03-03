module Control.Effect.Class.State 
    ( State(..)
    , gets
    , modify
    , modifyM
    , withState
    ) 
where


class State s m where
    get :: m s
    put :: s -> m ()


gets :: (Functor m, State s m) => (s -> a) -> m a
{-# INLINE gets #-}
gets l = do
    fmap l get


modify :: (Monad m, State s m) => (s -> s) -> m ()
{-# INLINE modify #-}
modify k = do
    s <- get
    put (k s)


modifyM :: (Monad m, State s m) => (s -> m s) -> m ()
{-# INLINE modifyM #-}
modifyM k = do
    s <- get
    res <- k s
    put res


withState :: (Monad m, State s m) => (s -> s) -> (m a -> m a)
{-# INLINE withState #-}
withState f ma = do
    s <- get
    put (f s)
    a <- ma
    put s
    return a
