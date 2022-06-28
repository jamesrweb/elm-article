module CurrencyConversion.Main exposing (..)

import Browser exposing (sandbox)
import CurrencyConversion.Currency as Currency
import CurrencyConversion.Input as Input
import Html exposing (Html)



-- MAIN


main : Program () Model Msg
main =
    sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { eur : Currency.Currency Currency.Eur
    , gbp : Currency.Currency Currency.Gbp
    , jpy : Currency.Currency Currency.Jpy
    }


init : Model
init =
    { eur = Currency.initEur 0
    , gbp = Currency.initGbp 0
    , jpy = Currency.initJpy 0
    }



-- UPDATE


type Msg
    = GbpChanged String
    | EurChanged String
    | JpyChanged String


inputStringToFloat : String -> Float
inputStringToFloat inputValue =
    Maybe.withDefault 0 (String.toFloat inputValue)


update : Msg -> Model -> Model
update msg model =
    case msg of
        EurChanged inputValue ->
            let
                eur =
                    inputValue |> inputStringToFloat |> Currency.initEur

                gbp =
                    Currency.convert Currency.eurToGbp eur

                jpy =
                    Currency.convert Currency.eurToJpy eur
            in
            { model | jpy = jpy, gbp = gbp, eur = eur }

        GbpChanged inputValue ->
            let
                gbp =
                    inputValue |> inputStringToFloat |> Currency.initGbp

                jpy =
                    Currency.convert Currency.gbpToJpy gbp

                eur =
                    Currency.convert Currency.gbpToEur gbp
            in
            { model | jpy = jpy, gbp = gbp, eur = eur }

        JpyChanged inputValue ->
            let
                jpy =
                    inputValue |> inputStringToFloat |> Currency.initJpy

                gbp =
                    Currency.convert Currency.jpyToGbp jpy

                eur =
                    Currency.convert Currency.jpyToEur jpy
            in
            { model | jpy = jpy, gbp = gbp, eur = eur }



-- View


view : Model -> Html Msg
view model =
    Html.div []
        [ Input.view { onInput = EurChanged, label = "EUR", value = Currency.valueOf model.eur }
        , Input.view { onInput = GbpChanged, label = "GBP", value = Currency.valueOf model.gbp }
        , Input.view { onInput = JpyChanged, label = "JPY", value = Currency.valueOf model.jpy }
        ]
