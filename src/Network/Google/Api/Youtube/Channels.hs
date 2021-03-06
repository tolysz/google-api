module Network.Google.Api.Youtube.Channels where

 -- https://developers.google.com/youtube/v3/docs/#Channels

import Prelude             (Bool, Integer, Int, Show(..))
import Data.Aeson          (Value)
import Data.Text           (Text)
import Data.Possible       (Possible)
import Data.Typeable       (Typeable)
import Data.Time.Clock     (UTCTime(..))
import Data.HashMap.Strict (HashMap)
import GHC.Generics        (Generic)
import Network.Google.Api.Kinds    (AsStr, ListResponse, ApiKind)
import Network.Google.Api.Youtube.Common
-- import Network.Google.Api.UtilsTH    (thStuff)
import Data.Aeson.TH             (deriveJSON)
import Control.Lens              (makeLenses)
import Network.Google.Api.Utils  (optsL)


data YCContentDetails = YCContentDetails
  { _yccdGooglePlusUserId :: Text
  , _yccdRelatedPlaylists :: HashMap Text PlaylistId
                                    -- \_> likes,favorites,uploads,watchHistory,watchLater -> playlistId
  } deriving  (Show, Typeable, Generic)

data YCSnippet = YCSnippet
  { _ycsnPublishedAt  :: UTCTime
  , _ycsnTitle        :: Text
  , _ycsnDescription  :: Text
  , _ycsnLocalized    :: Value -- todo: fix
  , _ycsnThumbnails   :: HashMap Text YThumbnail
  } deriving  (Show, Typeable, Generic)

data YCStatistics = YCStatistics
  { _ycstViewCount             :: AsStr Integer
  , _ycstCommentCount          :: AsStr Integer
  , _ycstSubscriberCount       :: AsStr Integer
  , _ycstHiddenSubscriberCount :: Bool
  , _ycstVideoCount            :: AsStr Integer
  } deriving  (Show, Typeable, Generic)

data YCTopicDetails = YCTopicDetails
  { _yctdTopicIds :: [ Text ]
  } deriving  (Show, Typeable, Generic)

data YCStatus = YCStatus
  { _ycsPrivacyStatus     :: Text
  , _ycsIsLinked          :: Bool
  , _ycsLongUploadsStatus :: Text
  } deriving  (Show, Typeable, Generic)

data YCAuditDetails = YCAuditDetails
  { _ycaOverallGoodStanding             :: Bool
  , _ycaCommunityGuidelinesGoodStanding :: Bool
  , _ycaCopyrightStrikesGoodStanding    :: Bool
  , _ycaContentIdClaimsGoodStanding     :: Bool
  } deriving  (Show, Typeable, Generic)

data YCContentOwnerDetails = YCContentOwnerDetails
  { _ycodContentOwner :: Text
  , _ycodTimeLinked   :: UTCTime
  } deriving  (Show, Typeable, Generic)

type YoutubeChannels = (ListResponse YoutubeChannel "youtube#channelListResponse")


data YoutubeChannel = YoutubeChannel
  { _ycKind                :: ApiKind "youtube#channel"     -- present
  , _ycEtag                :: Text                          -- present
  , _ycId                  :: Text                          -- present
  , _ycSnippet             :: Possible YCSnippet            -- present
  , _ycContentDetails      :: Possible YCContentDetails     -- present
  , _ycStatistics          :: Possible YCStatistics         -- present
  , _ycTopicDetails        :: Possible YCTopicDetails       -- missing
  , _ycStatus              :: Possible YCStatus             -- present
  , _ycContentOwnerDetails :: Possible YCContentOwnerDetails -- missing did not see a response
  , _ycBrandingSettings    :: Possible YCBrandingSettings   -- todo: implement
  , _ycInvideoPromotion    :: Possible YCInvideoPromotion   -- todo: implement
  } deriving  (Show, Typeable, Generic)

-- type instance ListBase YoutubeChannel = (ListResponse YoutubeChannel "youtube#channelListResponse")

type PlaylistId         = Text
type YCBrandingSettings = Value
type YCInvideoPromotion = Value

-- Borring TH stuff
deriveJSON (optsL 5) ''YCSnippet
makeLenses           ''YCSnippet

deriveJSON (optsL 4) ''YCStatus
makeLenses           ''YCStatus

deriveJSON (optsL 5) ''YCTopicDetails
makeLenses           ''YCTopicDetails

deriveJSON (optsL 5) ''YCStatistics
makeLenses           ''YCStatistics

deriveJSON (optsL 5) ''YCContentDetails
makeLenses           ''YCContentDetails

deriveJSON (optsL 4) ''YCAuditDetails
makeLenses           ''YCAuditDetails

deriveJSON (optsL 5) ''YCContentOwnerDetails
makeLenses           ''YCContentOwnerDetails

deriveJSON (optsL 3) ''YoutubeChannel
makeLenses           ''YoutubeChannel
