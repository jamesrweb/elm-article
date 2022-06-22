module Stateless.AcceptTermsAndConditions exposing (view)

import Html exposing (Html)
import Stateless.Checkbox as Checkbox


type alias Model msg =
    { isTermsAndConditionsChecked : Bool
    , isMarketingChecked : Bool
    , onTermsAndConditionsClicked : msg
    , onMarketingClicked : msg
    , onAcceptAllClicked : msg
    }


view : Model msg -> Html msg
view model =
    Html.div []
        [ Checkbox.view
            { isChecked = model.isTermsAndConditionsChecked && model.isMarketingChecked
            , onClick = model.onAcceptAllClicked
            , label = "Accept all"
            }
        , Checkbox.view
            { isChecked = model.isTermsAndConditionsChecked
            , onClick = model.onTermsAndConditionsClicked
            , label = "Accept terms and conditions"
            }
        , Checkbox.view
            { isChecked = model.isMarketingChecked
            , onClick = model.onMarketingClicked
            , label = "Accept marketing"
            }
        ]
