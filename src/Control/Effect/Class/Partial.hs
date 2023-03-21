{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleInstances #-}
module Control.Effect.Class.Partial 
    ( Partial(..)
    , Recover(..)
    , Void
    , Fail
    , nil
    , catches
    )
where

import Data.Either
import Data.Functor
import Prelude ((.), pure)
import Control.Monad
import Data.Void (absurd, Void)
import Control.Monad.Effects.Helper


type Fail m = (Partial m, Recover m)


-- | This class is used to prove that the
-- functor `m` can produce nullary values.
-- If a monad can satisfy this type, then 
-- it contains some partiality into it or a bottom 
-- itself, like `let x = x in x`.
--
-- e.g:
-- ```instance Partial Maybe where
--        partial = Nothing
-- ```
class 
    (Monad m) 
    => Partial m 
  where
    partial :: m Void


-- | A nullary value in some monad `m`.
nil :: (Partial m) => m a
{-# INLINE nil #-}
nil = 
    fmap absurd partial


-- | Like a `Nothing` in the `Maybe` monad or an empty 
-- list in the list type.
-- e.g:
-- ```instance Recover Maybe where
--        recover = maybe (Left partial) Right
-- ```
class 
    (Monad m) 
    => Recover m 
  where
    recover :: m ~> Either (m Void)


catches :: (Recover m) => (m Void -> m a) -> (m a -> m a)
{-# INLINE catches #-}
catches f =
    either f pure . recover
