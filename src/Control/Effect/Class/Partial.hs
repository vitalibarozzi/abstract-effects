{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Partial 
    ( Partial(..)
    , nil
    -- * Reexport
    , Void
    , absurd
    )
where

import Data.Void (absurd, Void)
--import Control.Exception qualified as Exception


-- | This class is used to prove that the
-- functor `m` can produce nullary values.
-- E.g: the partial value for `Maybe` is `Nothing`.
class (Monad m) => Partial m where
    partial :: m Void
    isPartial :: m a -> Bool

    {-# INLINE recover #-}
    recover :: m a -> (m a -> m a) -> m a
    recover ma f = if isPartial ma then f ma else ma


-- | Like a `Nothing` in the `Maybe` monad or an empty 
-- list in the list type.
nil :: (Partial m, Functor m) => m a
{-# INLINE nil #-}
nil = fmap absurd partial


-- Orphans


instance Partial Maybe where 
    {-# INLINE partial #-}
    partial = Nothing
    {-# INLINE isPartial #-}
    isPartial Nothing = True
    isPartial (Just _) = False


instance Partial [] where
    {-# INLINE partial #-}
    partial = []
    {-# INLINE isPartial #-}
    isPartial [] = True
    isPartial (_ : _) = False
