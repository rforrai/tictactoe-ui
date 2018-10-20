module Main exposing (Model, Msg(..), init, main, update, view)

import Board exposing (board)
import Browser
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Style


main =
    Browser.sandbox { init = init, view = view >> toUnstyled, update = update }


type alias Model =
    {}


type Msg
    = NoOp


init : Model
init =
    {}


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


view : Model -> Html Msg
view model =
    div [ css Style.root ]
        [ board
        ]
