module Stateless.Main exposing (..)

import Browser
import Html exposing (Html)
import Stateless.AcceptTermsAndConditions as AcceptTermsAndConditions



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { allAccepted : Bool
    , marketingAccepted : Bool
    , termsAndConditionsAccepted : Bool
    }


init : Model
init =
    { allAccepted = False
    , marketingAccepted = False
    , termsAndConditionsAccepted = False
    }



-- UPDATE


type Msg
    = AllTermsClicked
    | MarketingClicked
    | TermsAndConditionsClicked


update : Msg -> Model -> Model
update msg model =
    case msg of
        AllTermsClicked ->
            let
                allAccepted =
                    not model.allAccepted
            in
            { model
                | allAccepted = allAccepted
                , marketingAccepted = allAccepted
                , termsAndConditionsAccepted = allAccepted
            }

        MarketingClicked ->
            let
                marketingAccepted =
                    not model.marketingAccepted
            in
            { model
                | marketingAccepted = marketingAccepted
                , allAccepted = marketingAccepted && model.termsAndConditionsAccepted
            }

        TermsAndConditionsClicked ->
            let
                termsAndConditionsAccepted =
                    not model.termsAndConditionsAccepted
            in
            { model
                | termsAndConditionsAccepted = termsAndConditionsAccepted
                , allAccepted = termsAndConditionsAccepted && model.marketingAccepted
            }



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ AcceptTermsAndConditions.view
            { onAcceptAllClicked = AllTermsClicked
            , onMarketingClicked = MarketingClicked
            , onTermsAndConditionsClicked = TermsAndConditionsClicked
            , isMarketingChecked = model.marketingAccepted
            , isTermsAndConditionsChecked = model.termsAndConditionsAccepted
            }
        ]
