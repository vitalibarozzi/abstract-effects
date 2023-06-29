module Control.Effect.Class.State 
    ( State(..)
    , gets
    , modify
    , modifyM
    ) 
where

import Prelude ((.))
import Control.Monad (Monad, (>>=))
import Control.Applicative (pure)
import Data.Functor (fmap)

class (Monad m) => State s m where
    -- try ((s,a) -> (s,b)) -> (a -> m b)
    get :: m s
    put :: s -> m ()


gets :: (State s m) => (s -> a) -> m a
{-# INLINE gets #-}
gets l = 
    fmap l get


modify :: (State s m) => (s -> s) -> m ()
{-# INLINE modify #-}
modify k =
    modifyM (pure . k)


modifyM :: (State s m) => (s -> m s) -> m ()
{-# INLINE modifyM #-}
modifyM k =
    get >>= k >>= put
