module CurrencyConversion.Input exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput)


type alias Model msg =
    { onInput : String -> msg
    , label : String
    , value : Float
    }


view : Model msg -> Html msg
view model =
    let
        labelText =
            model.label ++ ": "
    in
    Html.div []
        [ Html.label []
            [ Html.text labelText
            , Html.input
                [ onInput model.onInput
                , value (String.fromFloat model.value)
                ]
                []
            ]
        ]
