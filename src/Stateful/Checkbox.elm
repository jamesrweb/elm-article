module Stateful.Checkbox exposing (Model, Msg, initUnchecked, update, view)

import Html exposing (Html)
import Html.Attributes exposing (checked, type_)
import Html.Events exposing (onClick)


type alias Model =
    { isChecked : Bool, label : String }


type Msg
    = CheckboxClicked


initUnchecked : String -> Model
initUnchecked label =
    { isChecked = False, label = label }


update : Msg -> Model -> Model
update msg model =
    case msg of
        CheckboxClicked ->
            { model | isChecked = not model.isChecked }


view : Model -> Html Msg
view model =
    Html.label []
        [ Html.input
            [ type_ "checkbox"
            , checked model.isChecked
            , onClick CheckboxClicked
            ]
            []
        , Html.text model.label
        ]
