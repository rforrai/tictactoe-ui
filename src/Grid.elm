module Grid exposing (cross, grid, nought)

import Css exposing (Style, property)
import String exposing (concat)
import Style
import Svg.Styled exposing (..)
import Svg.Styled.Attributes exposing (css, d, viewBox)


vars =
    Style.variables


line : ( Int, Int ) -> ( Int, Int ) -> (Float -> List Style) -> Svg a
line ( x1, y1 ) ( x2, y2 ) style =
    let
        length =
            sqrt (toFloat ((x2 - x1) ^ 2 + (y2 - y1) ^ 2))

        instructions =
            "M" ++ String.fromInt x1 ++ "," ++ String.fromInt y1 ++ "L" ++ String.fromInt x2 ++ "," ++ String.fromInt y2
    in
    path [ d instructions, css <| style length ] []


nought : Svg a
nought =
    svg
        [ css Style.symbol
        , viewBox "0 0 128 128"
        ]
        [ path
            [ d "M64,16A48,48 0 1,0 64,112A48,48 0 1,0 64,16"
            , css Style.nought
            ]
            []
        ]


cross : Svg a
cross =
    svg
        [ css Style.symbol
        , viewBox "0 0 128 128"
        ]
        [ line ( 16, 16 ) ( 112, 112 ) Style.crossLine
        , line ( 112, 16 ) ( 16, 112 ) Style.crossLine
        ]


grid : Int -> Int -> Svg a
grid width borderPadding =
    let
        base =
            borderPadding

        center =
            2 * borderPadding + floor (toFloat width * 3 / 2)

        closeCenter =
            borderPadding + width + (vars.borderWidth // 2)

        farCenter =
            2 * borderPadding + 2 * width + (vars.borderWidth // 2)

        far =
            3 * borderPadding + 3 * width

        totalWidth =
            toFloat (4 * borderPadding + 3 * width)

        gridLine =
            \from to -> line from to Style.gridLine
    in
    svg
        [ css (Style.grid totalWidth totalWidth)
        ]
        [ gridLine ( center, closeCenter ) ( base, closeCenter )
        , gridLine ( center, farCenter ) ( base, farCenter )
        , gridLine ( center, closeCenter ) ( far, closeCenter )
        , gridLine ( center, farCenter ) ( far, farCenter )
        , gridLine ( closeCenter, center ) ( closeCenter, base )
        , gridLine ( farCenter, center ) ( farCenter, base )
        , gridLine ( closeCenter, center ) ( closeCenter, far )
        , gridLine ( farCenter, center ) ( farCenter, far )
        ]
