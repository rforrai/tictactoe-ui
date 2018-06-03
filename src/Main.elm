module Main exposing (..)

import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Style
import Board exposing (board)


main =
    Html.beginnerProgram { model = model, view = view >> toUnstyled, update = update }


type alias Model =
    {}


type Msg
    = NoOp


model : Model
model =
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
