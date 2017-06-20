{-# LANGUAGE ScopedTypeVariables #-}

module Pos.Communication.Specs
       ( createOutSpecs
       ) where

import           Node.Message.Class            (Message (..))
import           Universum

import           Network.Broadcast.Relay       (InvOrData, ReqMsg)
import           Pos.Communication.Protocol    (OutSpecs, convH, toOutSpecs)

createOutSpecs :: forall key contents .
               ( Message (InvOrData key contents)
               , Message (ReqMsg key))
               => Proxy (InvOrData key contents)
               -> OutSpecs
createOutSpecs proxy = toOutSpecs [convH proxy (toReqProxy proxy)]
  where
    toReqProxy :: Proxy (InvOrData key contents) -> Proxy (ReqMsg key)
    toReqProxy _ = Proxy
