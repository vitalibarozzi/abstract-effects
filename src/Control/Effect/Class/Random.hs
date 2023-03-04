{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Random 
    ( Random(..)
    )
where


class Random a m where
    roll :: m a


instance (Monad m, Random a m) => Random [a] m where
    {-# INLINE roll #-}
    roll = do
        i0 <- roll
        is <- roll
        return (i0 : is)


instance (Monad m, Random a m) => Random (a,a) m where
    {-# INLINE roll #-}
    roll = do
        i0 <- roll
        i1 <- roll
        return (i0, i1)


instance (Monad m, Random a m) => Random (a,a,a) m where
    {-# INLINE roll #-}
    roll = do
        i0 <- roll
        (i1, i2) <- roll
        return (i0, i1, i2)


instance (Monad m, Random a m) => Random (a,a,a,a) m where
    {-# INLINE roll #-}
    roll = do
        i0 <- roll
        (i1, i2, i3) <- roll
        return (i0, i1, i2, i3)


instance (Monad m, Random a m) => Random (a,a,a,a,a) m where
    {-# INLINE roll #-}
    roll = do
        i0 <- roll
        (i1, i2, i3, i4) <- roll
        return (i0, i1, i2, i3, i4)


instance (Monad m, Random a m) => Random (a,a,a,a,a,a) m where
    {-# INLINE roll #-}
    roll = do
        i0 <- roll
        (i1, i2, i3, i4, i5) <- roll
        return (i0, i1, i2, i3, i4, i5)
