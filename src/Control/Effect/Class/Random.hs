{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Random 
    ( Random(..)
    )
where


class Random a m where
    random :: m a


-- | Lazy list.
-- TODO test it
instance (Monad m, Random a m) => Random [a] m where
    {-# INLINE random #-}
    random = do
        i0 <- random
        is <- random
        return (i0 : is)


instance (Monad m, Random a m) => Random (a,a) m where
    {-# INLINE random #-}
    random = do
        i0 <- random
        i1 <- random
        return (i0, i1)


instance (Monad m, Random a m) => Random (a,a,a) m where
    {-# INLINE random #-}
    random = do
        i0 <- random
        (i1, i2) <- random
        return (i0, i1, i2)


instance (Monad m, Random a m) => Random (a,a,a,a) m where
    {-# INLINE random #-}
    random = do
        i0 <- random
        (i1, i2, i3) <- random
        return (i0, i1, i2, i3)


instance (Monad m, Random a m) => Random (a,a,a,a,a) m where
    {-# INLINE random #-}
    random = do
        i0 <- random
        (i1, i2, i3, i4) <- random
        return (i0, i1, i2, i3, i4)


instance (Monad m, Random a m) => Random (a,a,a,a,a,a) m where
    {-# INLINE random #-}
    random = do
        i0 <- random
        (i1, i2, i3, i4, i5) <- random
        return (i0, i1, i2, i3, i4, i5)
