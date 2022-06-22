module Stateful.AcceptTermsAndConditions exposing (Model, Msg, initUnchecked, update, view)

import Html exposing (Html)
import Stateful.Checkbox as Checkbox


type alias Model =
    { allAccepted : Checkbox.Model
    , termsAndConditionsAccepted : Checkbox.Model
    , marketingAccepted : Checkbox.Model
    }


type Msg
    = AllTermsClicked Checkbox.Msg
    | MarketingClicked Checkbox.Msg
    | TermsAndConditionsClicked Checkbox.Msg


initUnchecked : Model
initUnchecked =
    { allAccepted = Checkbox.initUnchecked "Accept all"
    , marketingAccepted = Checkbox.initUnchecked "Accept marketing"
    , termsAndConditionsAccepted = Checkbox.initUnchecked "Accept terms and conditions"
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        AllTermsClicked message ->
            let
                currentMarketingAcceptedState =
                    model.marketingAccepted

                currentTermsAndConditionsAcceptedState =
                    model.termsAndConditionsAccepted

                allAccepted =
                    Checkbox.update message model.allAccepted

                marketingAccepted =
                    { currentMarketingAcceptedState | isChecked = allAccepted.isChecked }

                termsAndConditionsAccepted =
                    { currentTermsAndConditionsAcceptedState | isChecked = allAccepted.isChecked }
            in
            { model
                | allAccepted = allAccepted
                , marketingAccepted = marketingAccepted
                , termsAndConditionsAccepted = termsAndConditionsAccepted
            }

        MarketingClicked message ->
            let
                currentAllAcceptedState =
                    model.allAccepted

                marketingAccepted =
                    Checkbox.update message model.marketingAccepted

                allAccepted =
                    { currentAllAcceptedState
                        | isChecked = marketingAccepted.isChecked && model.termsAndConditionsAccepted.isChecked
                    }
            in
            { model | marketingAccepted = marketingAccepted, allAccepted = allAccepted }

        TermsAndConditionsClicked message ->
            let
                currentAllAcceptedState =
                    model.allAccepted

                termsAndConditionsAccepted =
                    Checkbox.update message model.termsAndConditionsAccepted

                allAccepted =
                    { currentAllAcceptedState
                        | isChecked = termsAndConditionsAccepted.isChecked && model.marketingAccepted.isChecked
                    }
            in
            { model | termsAndConditionsAccepted = termsAndConditionsAccepted, allAccepted = allAccepted }


view : Model -> Html Msg
view model =
    Html.div []
        [ Checkbox.view model.allAccepted
            |> Html.map AllTermsClicked
        , Checkbox.view model.termsAndConditionsAccepted
            |> Html.map TermsAndConditionsClicked
        , Checkbox.view model.marketingAccepted
            |> Html.map MarketingClicked
        ]
