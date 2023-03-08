{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Output 
    ( Output(..)
    )
where


class Output o m where
    output :: o -> m ()


-- | Lazy list as output.
-- TODO test it
instance (Monad m, Output o m) => Output [o] m where
    {-# INLINE output #-}
    output [] = return ()
    output (o : os) = do
        () <- output o
        output os


instance (Monad m, Output o m) => Output (o,o) m where
    {-# INLINE output #-}
    output (o0, o1) = do
       () <- output o0
       output o1


instance (Monad m, Output o m) => Output (o,o,o) m where
    {-# INLINE output #-}
    output (o0, o1, o2) = do
       () <- output o0
       output (o1,o2)


instance (Monad m, Output o m) => Output (o,o,o,o) m where
    {-# INLINE output #-}
    output (o0, o1, o2, o3) = do
       () <- output o0
       output (o1,o2,o3)


instance (Monad m, Output o m) => Output (o,o,o,o,o) m where
    {-# INLINE output #-}
    output (o0, o1, o2, o3, o4) = do
       () <- output o0
       output (o1,o2,o3,o4)


instance (Monad m, Output o m) => Output (o,o,o,o,o,o) m where
    {-# INLINE output #-}
    output (o0, o1, o2, o3, o4, o5) = do
       () <- output o0
       output (o1,o2,o3,o4,o5)

