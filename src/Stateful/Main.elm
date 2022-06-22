module Stateful.Main exposing (main)

import Browser
import Html exposing (Html)
import Stateful.AcceptTermsAndConditions as AcceptTermsAndConditions



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { terms : AcceptTermsAndConditions.Model }


init : Model
init =
    { terms = AcceptTermsAndConditions.initUnchecked
    }



-- UPDATE


type Msg
    = TermsToggle AcceptTermsAndConditions.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        TermsToggle message ->
            { model | terms = AcceptTermsAndConditions.update message model.terms }



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ AcceptTermsAndConditions.view model.terms |> Html.map TermsToggle
        ]
