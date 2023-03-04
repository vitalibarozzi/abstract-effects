{-# LANGUAGE ImplicitParams #-}
module Control.Effect.Class.FileSystem
    (
    ) 
where

import Data.Text
import Data.Kind


class FileSystem m where
    withFile :: FilePath -> ((OpenFile => m a) -> m a)
    withDir  :: FilePath -> ((OpenDir  => m a) -> m a)


type OpenFile = () :: Constraint
type OpenDir = () :: Constraint


writeFile :: Text -> (OpenFile => m ())
writeFile _ = undefined


content :: OpenFile => m Text
content = undefined


readFilePath :: OpenFile => m FilePath
readFilePath = undefined


directoryPath :: OpenDir => m FilePath
directoryPath = undefined


directoryContents :: OpenDir => m [FilePath]
directoryContents = undefined


directoryFiles :: OpenDir => m [FilePath]
directoryFiles = undefined


directoryChilds :: OpenDir => m [FilePath]
directoryChilds = undefined


withChild :: FilePath -> (OpenDir => m a) -> (OpenDir => m a)
withChild _ _ = undefined
