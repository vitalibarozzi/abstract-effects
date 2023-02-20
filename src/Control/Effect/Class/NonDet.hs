module Control.Effect.Class.NonDet (NonDet(..)) where


class NonDet a m where
    roll :: m a
