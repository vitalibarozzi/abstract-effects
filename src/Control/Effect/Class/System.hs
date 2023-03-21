{-# LANGUAGE OverloadedStrings #-}
module Control.Effect.Class.System where

import Data.Text
import Data.Version
import Data.Time
import Control.Monad


class 
    (Monad f)
    => System f 
  where
    withOS :: (Text -> f a) -> f a
    {-# INLINE withOS #-}
    withOS = let x = x in x -- pure (pack System.Info.os)

    withArch :: (Text -> f a) -> f a
    {-# INLINE withArch #-}
    withArch = let x = x in x -- pure (pack System.Info.arch)

    withCompilerName :: (Text -> f a) -> f a
    {-# INLINE withCompilerName #-}
    withCompilerName = let x = x in x -- pure (pack System.Info.compilerName)

    withCompilerVersion :: (Version -> f a) -> f a
    {-# INLINE withCompilerVersion #-}
    withCompilerVersion = let x = x in x -- pure System.Info.compilerVersion

    withApplicationCompiledAt :: (UTCTime -> f a) -> f a
    {-# INLINE withApplicationCompiledAt  #-}
    withApplicationCompiledAt = let x = x in x -- let x = x in x -- TODO

    withApplicationVersion :: (Version -> f a) -> f a
    {-# INLINE withApplicationVersion #-}
    withApplicationVersion = let x = x in x -- let x = x in x -- TODO

    withApplicationDescription :: (Text -> f a) -> f a
    {-# INLINE withApplicationDescription    #-}
    withApplicationDescription = let x = x in x -- pure "No description given."


os :: System f => f Text
{-# INLINE os #-}
os = withOS return

arch :: System f => f Text
{-# INLINE arch #-}
arch = withArch return

compilerName :: System f => f Text
{-# INLINE compilerName #-}
compilerName = withCompilerName return

compilerVersion :: System f => f Version
{-# INLINE compilerVersion #-}
compilerVersion = withCompilerVersion return

applicationCompiledAt :: System f => f UTCTime
{-# INLINE applicationCompiledAt  #-}
applicationCompiledAt = withApplicationCompiledAt return

applicationVersion :: System f => f Version
{-# INLINE applicationVersion #-}
applicationVersion = withApplicationVersion return

applicationDescription :: System f => f Text
{-# INLINE applicationDescription    #-}
applicationDescription = withApplicationDescription return
