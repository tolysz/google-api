module Network.Google.Api.Youtube.Common where
 -- (YoutubeChannel (..), YoutubeChannels)
 -- go for everything as TH does not export itself

 -- https://developers.google.com/youtube/v3/docs/#Channels

import Prelude             ( -- Bool, Integer,
                             Int, Show(..))
-- import Data.Aeson          (Value)
import Data.Text           (Text)
import Data.Possible       (Possible)
import Data.Typeable       (Typeable)
-- import Data.Time.Clock     (UTCTime(..))
import Data.HashMap.Strict (HashMap)
import GHC.Generics        (Generic)
import Network.Google.Api.Kinds    (AsStr, ListResponse, ApiKind)
import Network.Google.Api.UtilsTH    (thStuff)

data YThumbnail = YThumbnail
  { _ytUrl    :: Text
  , _ytWidth  :: Possible Int
  , _ytHeight :: Possible Int
  } deriving (Show, Typeable, Generic)

-- data YCSnippet = YCSnippet
--   { _ysnPublishedAt  :: UTCTime
--   , _ysnChannelId    :: Text
--   , _ysnTitle        :: Text
--   , _ysnDescription  :: Text
--   , _ysnThumbnails   :: HashMap Text YThumbnail
--   , _ysnChannelTitle :: Text
--   } deriving  (Show, Typeable, Generic)
-- deriveJSON optsL4 ''YCSnippet
-- makeLenses        ''YCSnippet

thStuff 3 ''YThumbnail

