{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module Control.Effect.Class.Except
    ( Except(..)
    , Error
    , Fail
    , fail
    , throw
    , catchBy
    -- | Reexport
    , Exception
    ) 
where


import Control.Exception (Exception,SomeException)
import Data.Void (Void, absurd)


type Fail = MonadFail
type Error m = Except SomeException m


class Except e m where
    except :: (Exception e) => e -> m Void
    catch  :: (Exception e) => (e -> m a) -> (m a -> m a)


{-# HLINT ignore #-}
catchBy :: (Exception e, Except e m) => m a -> (e -> m a) -> m a
{-# INLINE catchBy #-}
catchBy = flip catch


throw :: (Exception e, Except e m, Functor m) => e -> m a 
{-# INLINE throw #-}
throw = fmap absurd . except
