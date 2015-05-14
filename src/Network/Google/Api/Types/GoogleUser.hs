module Network.Google.Api.Types.GoogleUser
 (GoogleUser (..))
 where

import Data.Text          (Text)
import Data.Possible
import Data.Default
import Data.Typeable
import GHC.Generics
import Network.Google.Api.UtilsTH    (thStuff)

data GoogleUser = GoogleUser
  { _googleUserId            :: Possible Text
  , _googleUserName          :: Possible Text
  , _googleUserGivenName     :: Possible Text
  , _googleUserFamilyName    :: Possible Text
  , _googleUserLink          :: Possible Text
  , _googleUserPicture       :: Possible Text
  , _googleUserGender        :: Possible Text
  , _googleUserBirthday      :: Possible Text
  , _googleUserLocale        :: Possible Text
  , _googleUserEmail         :: Possible Text
  , _googleUserVerifiedEmail :: Possible Bool
  } deriving  (Show, Typeable, Generic)

instance Default GoogleUser where
  def = GoogleUser MissingData MissingData MissingData MissingData MissingData MissingData MissingData MissingData MissingData MissingData MissingData

thStuff 11 ''GoogleUser
