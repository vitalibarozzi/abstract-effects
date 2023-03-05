{-# LANGUAGE ImplicitParams #-}
module Control.Effect.Class.FileSystem
    (
    ) 
where

import Data.Text
import Data.Kind

-- review it
{-
class FileSystem m where
    withFile :: FilePath -> ((OpenFile => m a) -> m a)
    withDir  :: FilePath -> ((OpenDir  => m a) -> m a)


type OpenFile = ?openFile :: (FilePath, ()) -- TODO should it have the FD inside?
type OpenDir = ?openDir :: (FilePath, [FilePath])


write :: Text -> (OpenFile => m ())
write _ = undefined


content :: OpenFile => m Text
content = undefined


filepath :: OpenFile => FilePath
filepath = undefined


directoryPath :: OpenDir => FilePath
directoryPath = undefined


directoryContents :: OpenDir => m [FilePath]
directoryContents = undefined


directoryFiles :: OpenDir => m [FilePath]
directoryFiles = undefined


directoryChilds :: OpenDir => m [FilePath]
directoryChilds = undefined


withChildDir :: FilePath -> (OpenDir => m a) -> (OpenDir => m a)
withChildDir _ _ = undefined


withChildFile :: FilePath -> (OpenDir => m a) -> (OpenFile => m a)
withChildFile _ _ = undefined
-}
