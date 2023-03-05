module Control.Monad.Effects.Helpers where


-- | Natural transformation.
type (~>) f g = forall a. (f a -> g a)
