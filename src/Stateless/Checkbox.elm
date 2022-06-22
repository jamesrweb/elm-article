module Stateless.Checkbox exposing (view)

import Html exposing (Html)
import Html.Attributes
import Html.Events


type alias Model msg =
    { isChecked : Bool
    , onClick : msg
    , label : String
    }


view : Model msg -> Html msg
view model =
    Html.label []
        [ Html.input
            [ Html.Attributes.type_ "checkbox"
            , Html.Attributes.checked model.isChecked
            , Html.Events.onClick model.onClick
            ]
            []
        , Html.text model.label
        ]
