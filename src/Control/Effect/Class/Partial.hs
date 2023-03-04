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
    nullary :: m a -> m Bool

    {-# INLINE recover #-}
    recover :: m a -> (m Void -> m a) -> m a
    recover ma f = do isNull <- nullary ma; if isNull then f partial else ma


-- | Like a `Nothing` in the `Maybe` monad or an empty 
-- list in the list type.
nil :: (Partial m, Functor m) => m a
{-# INLINE nil #-}
nil = fmap absurd partial


-- Orphans


instance Partial Maybe where 
    {-# INLINE partial #-}
    partial = Nothing
    {-# INLINE nullary #-}
    nullary Nothing = return True
    nullary (Just _) = return False


instance Partial [] where
    {-# INLINE partial #-}
    partial = []
    {-# INLINE nullary #-}
    nullary [] = return True
    nullary (_ : _) = return False

{-
instance Partial IO where
    {-# INLINE partial #-}
    partial = error "todo"
    {-# INLINE nullary #-}
    nullary ma = 
        Exception.catch 
            (fmap (const False) ma) 
            (\(e :: Exception.SomeException) -> return True)
data PartialIOException = PartialIOException deriving (Show)
instance Exception.Exception PartialIOException
-}
