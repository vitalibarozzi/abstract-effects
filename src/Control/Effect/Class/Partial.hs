{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Partial 
    ( Partial(..)
    , nil
    -- * Reexport
    , Void
    )
where

import Data.Void (absurd, Void)


-- | This class is used to prove that the
-- functor `m` can produce nullary values.
-- E.g: the partial value for `Maybe` is `Nothing`.
class Partial m where
    partial :: m Void


nil :: (Partial m, Functor m) => m a
{-# INLINE nil #-}
nil = fmap absurd partial


-- Orphans


instance Partial Maybe where 
    {-# INLINE partial #-}
    partial = Nothing


instance Partial [] where
    {-# INLINE partial #-}
    partial = []
