{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Input 
    ( Input(..)
    ) 
where


class Input i m where
    input :: m i


instance (Monad m, Input i m) => Input [i] m where
    {-# INLINE input #-}
    input = do
        i0 <- input
        is <- input
        return (i0 : is)


instance (Monad m, Input i m) => Input (i,i) m where
    {-# INLINE input #-}
    input = do
        i0 <- input
        i1 <- input
        return (i0, i1)


instance (Monad m, Input i m) => Input (i,i,i) m where
    {-# INLINE input #-}
    input = do
        i0 <- input
        (i1, i2) <- input
        return (i0, i1, i2)


instance (Monad m, Input i m) => Input (i,i,i,i) m where
    {-# INLINE input #-}
    input = do
        i0 <- input
        (i1, i2, i3) <- input
        return (i0, i1, i2, i3)


instance (Monad m, Input i m) => Input (i,i,i,i,i) m where
    {-# INLINE input #-}
    input = do
        i0 <- input
        (i1, i2, i3, i4) <- input
        return (i0, i1, i2, i3, i4)


instance (Monad m, Input i m) => Input (i,i,i,i,i,i) m where
    {-# INLINE input #-}
    input = do
        i0 <- input
        (i1, i2, i3, i4, i5) <- input
        return (i0, i1, i2, i3, i4, i5)
