{-# LANGUAGE OverloadedStrings #-}

import Database.MongoDB
import Control.Monad
import Control.Monad.Trans (liftIO)

main = do
  pipe <- connect (host "localhost")
  void $ access pipe master "local" $ do
    liftIO . print =<< allDatabases
    xs <- rest =<< find (select [] "oplog.rs") {limit = 2 } --, sort = ["$natural" =: 1]}
    liftIO . print $ xs

