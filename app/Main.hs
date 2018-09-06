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
import Data.Numbers.Fibonacci (fibonacci)
import Numeric.Natural
import System.Environment

stringToNatural :: String -> Natural
stringToNatural x = read x :: Natural

getOut :: String -> [String] -> [String] -> [String]
getOut _ [] _ = [[]]
getOut _ _ [] = [[]]
getOut p x y =
  (p ++ " " ++ head x ++ " = " ++ head y) : getOut p (tail x) (tail y)

printOut :: [String] -> IO ()
printOut [[]] = putStr ""
printOut x = do
  putStrLn (head x)
  printOut (tail x)

main :: IO ()
main = do
  argsStrings <- getArgs
  progName <- getProgName
  printOut
    (getOut
       progName
       argsStrings
       (map (show . fibonacci . stringToNatural) argsStrings))
