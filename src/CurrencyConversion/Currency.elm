module CurrencyConversion.Currency exposing (..)

import Round


type Gbp
    = Gbp


type Eur
    = Eur


type Jpy
    = Jpy


type Currency a
    = Currency Float


type ExchangeRate from to
    = ExchangeRate Float


initEur : Float -> Currency Eur
initEur value =
    Currency value


initGbp : Float -> Currency Gbp
initGbp value =
    Currency value


initJpy : Float -> Currency Jpy
initJpy value =
    Currency value


jpyToGbp : ExchangeRate Jpy Gbp
jpyToGbp =
    ExchangeRate 0.0060594022


jpyToEur : ExchangeRate Jpy Eur
jpyToEur =
    ExchangeRate 0.0060577093


gbpToJpy : ExchangeRate Gbp Jpy
gbpToJpy =
    ExchangeRate 165.02646


gbpToEur : ExchangeRate Gbp Eur
gbpToEur =
    ExchangeRate 1.1633498


eurToGbp : ExchangeRate Eur Gbp
eurToGbp =
    ExchangeRate 0.85954686


eurToJpy : ExchangeRate Eur Jpy
eurToJpy =
    ExchangeRate 141.85126


add : Currency a -> Currency a -> Currency a
add (Currency c1) (Currency c2) =
    Currency (c1 + c2)


valueOf : Currency a -> Float
valueOf (Currency value) =
    value


convert : ExchangeRate from to -> Currency from -> Currency to
convert (ExchangeRate rate) (Currency currencyValue) =
    Currency <| Maybe.withDefault 0 <| String.toFloat <| Round.round 2 <| rate * currencyValue


addDifferent : ExchangeRate a b -> Currency a -> Currency b -> Currency b
addDifferent rate c1 c2 =
    add c2 (convert rate c1)
