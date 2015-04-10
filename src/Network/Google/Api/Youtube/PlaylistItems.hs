{-# Language DataKinds
           , OverloadedStrings
           , RecordWildCards
           , DeriveDataTypeable
           , GeneralizedNewtypeDeriving
           , DeriveGeneric
           , TemplateHaskell
           #-}

module Network.Google.Api.Youtube.PlaylistItems where

 -- https://developers.google.com/youtube/v3/docs/#PlaylistItems


import Prelude             (Bool, Integer, Int, Show(..))
import Data.Aeson          (Value)
import Data.Aeson.TH       (deriveJSON)
import Data.Text           (Text)
import Data.Possible       (Possible)
import Data.Typeable       (Typeable)
import Data.Time.Clock     (UTCTime(..))
import Data.HashMap.Strict (HashMap)
import Control.Lens        (makeLenses)
import GHC.Generics        (Generic)
import Network.Google.Api.Utils    (optsL)
import Network.Google.Api.Kinds    (AsStr, ListResponse, ApiKind)
import Network.Google.Api.Youtube.Common

type YoutubePlaylistItems = ListResponse YoutubePlaylistItem "youtube#playlistItemListResponse"

data YoutubePlaylistItem = YoutubePlaylistItem
  { _ypiKind           :: ApiKind "youtube#playlistItem" -- present
  , _ypiEtag           :: Text                           -- present
  , _ypiId             :: Text                           -- present
  , _ypiSnippet        :: Possible YPISnippet
  , _ypiStatus         :: Possible YPIStatus
  , _ypiContentDetails :: Possible YPIContentDetails
  } deriving (Show, Typeable, Generic)

type YPISnippet        = Value
type YPIStatus         = Value
type YPIContentDetails = Value

deriveJSON (optsL 4) ''YoutubePlaylistItem
makeLenses           ''YoutubePlaylistItem



