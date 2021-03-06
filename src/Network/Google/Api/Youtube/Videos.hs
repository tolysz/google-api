{-# Language DataKinds
           , OverloadedStrings
           , RecordWildCards
           , DeriveDataTypeable
           , GeneralizedNewtypeDeriving
           , DeriveGeneric
           , TemplateHaskell
           #-}

module Network.Google.Api.Youtube.Videos
where

 -- https://developers.google.com/youtube/v3/docs/#Videos

import Prelude             (Show(..))
import Data.Aeson          (Value)
import Data.Text           (Text)
import Data.Possible       (Possible)
import Data.Typeable       (Typeable)
import Data.Time.Clock     (UTCTime(..))
import Data.HashMap.Strict (HashMap)
import GHC.Generics        (Generic)
import Network.Google.Api.Kinds    (ListResponse, ApiKind)
import Network.Google.Api.Youtube.Common
-- import Network.Google.Api.UtilsTH    (thStuff)

import Data.Aeson.TH             (deriveJSON)
import Control.Lens              (makeLenses)
import Network.Google.Api.Utils  (optsL)

type YoutubeVideos = ListResponse YoutubeVideo "youtube#videoListResponse"

data YoutubeVideo = YoutubeVideo
  { _yvKind                 :: ApiKind "youtube#video"     -- present
  , _yvEtag                 :: Text                          -- present
  , _yvId                   :: Text                          -- present
  , _yvSnippet              :: Possible YVSnippet
  , _yvContentDetails       :: Possible YVContentDetails
  , _yvStatus               :: Possible YVStatus
  , _yvStatistics           :: Possible YVStatistics
  , _yvPlayer               :: Possible YVPlayer
  , _yvTopicDetails         :: Possible YVTopicDetails
  , _yvRecordingDetails     :: Possible YVRecordingDetails
  , _yvFileDetails          :: Possible YVFileDetails
  , _yvProcessingDetails    :: Possible YVProcessingDetails
  , _yvSuggestions          :: Possible YVSuggestions
  , _yvLiveStreamingDetails :: Possible YVLiveStreamingDetails
 } deriving  (Show, Typeable, Generic)

data YVSnippet = YVSnippet
  { _yvsnPublishedAt  :: UTCTime
  , _yvsnChannelId    :: Text
  , _yvsnTitle        :: Text  -- * always include
  , _yvsnDescription  :: Text
  , _yvsnThumbnails   :: HashMap Text YThumbnail
  , _yvsnChannelTitle :: Text
  , _yvsnLocalized    :: Possible Value -- todo: fix
  , _yvsnTags         :: Possible [Text]
  , _yvsnCategoryId   :: Text
  , _yvsnLiveBroadcastContent :: Text
  } deriving  (Show, Typeable, Generic)



type YVContentDetails       = Value
type YVStatus               = Value
type YVStatistics           = Value
type YVPlayer               = Value
type YVTopicDetails         = Value
type YVRecordingDetails     = Value
type YVFileDetails          = Value
type YVProcessingDetails    = Value
type YVSuggestions          = Value
type YVLiveStreamingDetails = Value


deriveJSON (optsL 5) ''YVSnippet
makeLenses           ''YVSnippet

deriveJSON (optsL 3) ''YoutubeVideo
makeLenses           ''YoutubeVideo
