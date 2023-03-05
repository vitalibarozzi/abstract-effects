{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module Control.Effect.Class.Except
    ( Except(..)
    , throw
    , catchBy
    -- | Reexport
    , Exception
    ) 
where


import Control.Exception (Exception,)
import Data.Void (Void, absurd)


class (Exception e) => Except e m where
    except :: e -> m Void
    catch  :: (e -> m a) -> (m a -> m a)


{-# HLINT ignore #-}
catchBy :: (Except e m) => m a -> (e -> m a) -> m a
{-# INLINE catchBy #-}
catchBy = flip catch


throw :: (Except e m, Functor m) => e -> m a 
{-# INLINE throw #-}
throw = fmap absurd . except
