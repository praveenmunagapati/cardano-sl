-- | Binary specification for txp-related (Pos.Txp) messages.

module Test.Pos.Txp.Identity.BinarySpec
       ( spec
       ) where

import           Test.Hspec              (Spec, describe)
import           Universum

import           Pos.Binary              ()
import qualified Pos.Constants           as Const
import qualified Pos.Communication.Relay as R
import qualified Pos.Txp                 as T
import           Pos.Types               (TxId)

import           Test.Pos.Util           (networkBinaryTest, msgLenLimitedTest)

spec :: Spec
spec =
  describe "Txp (transaction processing) system" $ do
    describe "Bi instances" $ do
      describe "Network" $ do
        networkBinaryTest @(R.InvMsg TxId T.TxMsgTag)
        networkBinaryTest @(R.ReqMsg TxId T.TxMsgTag)
        networkBinaryTest @(R.DataMsg T.TxMsgContents)
    describe "Message length limit" $ do
      msgLenLimitedTest
        @(R.InvMsg TxId T.TxMsgTag) Const.genesisMaxInvSize
      msgLenLimitedTest
        @(R.ReqMsg TxId T.TxMsgTag) Const.genesisMaxInvSize
