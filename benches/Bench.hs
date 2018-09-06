{-
Copyright (C) 2018 YangBy <yby@yangby.org>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
-}
module Main where

import Criterion.Main

import Data.Numbers.Fibonacci (fibonacci)

main :: IO ()
main =
  defaultMain
    [ bgroup
        "fibonacci"
        [ bench "0" $ whnf fibonacci 0
        , bench "8" $ whnf fibonacci 8
        , bench "64" $ whnf fibonacci 64
        , bench "4096" $ whnf fibonacci 4096
        ]
    ]
