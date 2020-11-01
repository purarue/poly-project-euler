module Main exposing (..)

import BigInt exposing (BigInt, add, compare, fromInt, fromIntString, mul, sub, toString)
import Browser
import Html exposing (Html, div, text)
import Maybe exposing (withDefault)
import String exposing (dropLeft, left, length)



-- calulates n to the mth power


nthPower : BigInt -> BigInt -> BigInt
nthPower n m =
    nthPowerHelper n n m



-- nthPower, pass the n value and accumulate the value


nthPowerHelper : BigInt -> BigInt -> BigInt -> BigInt
nthPowerHelper acc n m =
    if m == fromInt 1 then
        acc

    else
        nthPowerHelper (mul acc n) n (sub m (fromInt 1))



-- calculates the sum of the digits


digitSum : BigInt -> BigInt
digitSum n =
    digitSumHelper (fromInt 0) (toString n)


digitSumHelper : BigInt -> String -> BigInt
digitSumHelper acc nStr =
    if length nStr == 0 then
        acc

    else
        digitSumHelper (withDefault (fromInt 0) (left 1 nStr |> fromIntString) |> add acc) (dropLeft 1 nStr)



-- calculates the result


calculate : Int -> Int -> Model
calculate n m =
    nthPower (fromInt n) (fromInt m) |> digitSum



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL
-- The result of the calculation


type alias Model =
    BigInt


init : Model
init =
    calculate 2 1000



-- UPDATE


type Msg
    = Nothing


update : Msg -> Model -> Model
update msg model =
    model



-- VIEW


view : Model -> Html Msg
view model =
    div [] [ text (toString model) ]
