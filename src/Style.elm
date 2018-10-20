module Style exposing (boardTable, boardWrapper, crossLine, grid, gridLine, gridWrapper, line, nought, root, symbol, tableData, variables)

import Css exposing (..)


variables =
    { cellWidth = 128
    , borderWidth = 6
    , symbolWidth = 16
    }


root =
    [ width (pct 100)
    , height (pct 100)
    , backgroundColor (hex "FAF4E5")
    , fontFamily sansSerif
    , overflow auto
    ]


tableData =
    [ width (px variables.cellWidth)
    , height (px variables.cellWidth)
    , padding (px 0)
    , textAlign center
    ]


line : String -> Int -> Float -> List Style
line color strokeWidth length =
    [ property "stroke" color
    , property "stroke-width" (String.fromInt strokeWidth)
    , property "stroke-dasharray" (String.fromFloat length)
    , property "stroke-dashoffset" "0"
    ]


gridLine : Float -> List Style
gridLine =
    line "#61635D" variables.borderWidth


symbol =
    [ width (px 96)
    , height (px 96)
    ]


nought =
    [ property "stroke" "#BF3C38"
    , property "fill" "none"
    , property "stroke-width" "16px"
    , property "stroke-dasharray" "301.635"
    , property "stroke-dashoffset" "0"
    ]


crossLine : Float -> List Style
crossLine =
    line "#136DC1" variables.symbolWidth


grid : Float -> Float -> List Style
grid w h =
    [ width (px w)
    , height (px h)
    , position absolute
    , left (px 0)
    , right (px 0)
    , top (px 0)
    , margin auto
    ]


gridWrapper =
    [ position absolute
    , left (px 0)
    , right (px 0)
    , top (px 0)
    , margin auto
    ]


boardTable =
    [ borderSpacing (px <| toFloat variables.borderWidth)
    , padding (px 0)
    , margin2 (px 0) auto
    ]


boardWrapper =
    [ display block
    , position relative
    ]
