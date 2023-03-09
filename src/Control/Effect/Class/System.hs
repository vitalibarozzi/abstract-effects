{-# LANGUAGE OverloadedStrings #-}
module Control.Effect.Class.System 
    ( System(..)
    ) 
where


import Data.Text
import Data.Version
import System.Info
import Data.Time


class System m where
    os :: (Applicative m) => m Text
    {-# INLINE os #-}
    os = pure (pack System.Info.os)

    arch :: (Applicative m) => m Text
    {-# INLINE arch #-}
    arch = pure (pack System.Info.arch)

    compilerName :: (Applicative m) => m Text
    {-# INLINE compilerName #-}
    compilerName = pure (pack System.Info.compilerName)

    compilerVersion :: (Applicative m) => m Version
    {-# INLINE compilerVersion #-}
    compilerVersion = pure System.Info.compilerVersion

    applicationCompiledAt :: (Applicative m) => m UTCTime
    {-# INLINE applicationCompiledAt  #-}
    applicationCompiledAt = undefined -- TODO

    applicationVersion :: (Applicative m) => m Version
    {-# INLINE applicationVersion   #-}
    applicationVersion = undefined -- TODO

    applicationDescription :: (Applicative m) => m Text
    {-# INLINE applicationDescription    #-}
    applicationDescription = pure "No description given."
