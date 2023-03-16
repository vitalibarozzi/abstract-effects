module Control.Effect.Class.State 
    ( State(..)
    , get
    , put
    , gets
    , modify
    , modifyM
    , withLocal
    ) 
where

import Control.Monad


class State s m where
    withGet :: (s -> m a) -> m a
    withPut :: (m a, s) -> m a


get :: (State s m, Applicative m) => m s
{-# INLINE get #-}
get = 
    withGet pure


put :: (State s m, Applicative m) => s -> m ()
{-# INLINE put #-}
put = 
    withPut (pure ())


gets :: (State s m, Applicative m) => (s -> a) -> m a
{-# INLINE gets #-}
gets l =
    withGet (pure . l)


modify :: (Monad m, State s m) => (s -> s) -> m ()
{-# INLINE modify #-}
modify k =
    withGet (withPut (pure ()) . k)


modifyM :: (Monad m, State s m) => (s -> m s) -> m ()
{-# INLINE modifyM #-}
modifyM k =
    withGet (withPut (pure ()) <=< k)


withLocal :: (Monad m, State s m) => (s -> s) -> (m a -> m a)
{-# INLINE withLocal #-}
withLocal f ma =
    withGet (withPut ma . f)
