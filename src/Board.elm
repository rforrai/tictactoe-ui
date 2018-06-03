module Board exposing (board)

import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Style
import Grid exposing (grid, nought, cross)


vars =
    Style.variables


board : Html a
board =
    div [ css Style.boardWrapper ]
        [ grid (round vars.cellWidth) vars.borderWidth
        , table [ css Style.boardTable ]
            [ tbody []
                [ tr []
                    [ data nought
                    , data cross
                    , data nought
                    ]
                , tr []
                    [ data cross
                    , data cross
                    , data cross
                    ]
                , tr []
                    [ data nought
                    , data nought
                    , data cross
                    ]
                ]
            ]
        ]


data : Html a -> Html a
data content =
    td [ css Style.tableData ] [ content ]
