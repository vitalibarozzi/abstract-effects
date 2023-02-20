module Control.Effect.Class.Exception (Error(..), Exception, asserting, withAssertion, Partial) where

import Control.Exception hiding (throw)
import Data.Text

class Error e m where
    throw :: (Exception e) => e -> m a

type Partial = Error Text

instance {-# OVERLAPPABLE #-} Exception Text
instance {-# OVERLAPPABLE #-} Exception ()

instance {-# OVERLAPPABLE #-} (Exception e) => Error e IO where
    {-# INLINE throw #-}
    throw = throwIO

instance {-# OVERLAPPABLE #-} Error e Maybe where
    {-# INLINE throw #-}
    throw _ = Nothing

asserting :: (Partial m) => Bool -> Text -> m a
{-# INLINEABLE asserting #-}
asserting _ _ = undefined

withAssertion :: (Partial m) => Text -> Bool -> (m a -> m a)
{-# INLINEABLE withAssertion #-}
withAssertion _ _ = undefined
