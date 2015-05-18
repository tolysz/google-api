module Network.Google.Api.UtilsTH where

import Data.Aeson.TH             (deriveJSON)
import Control.Lens              (makeLenses)
import Network.Google.Api.Utils  (optsL)

-- Borring TH stuff
thStuff i t = do
    deriveJSON (optsL i) t
    makeLenses           t