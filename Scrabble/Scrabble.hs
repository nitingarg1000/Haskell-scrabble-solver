
module Scrabble (
   module Points,
   module Possible_permutations,
   module DictSearch,
   module Sort,
   module Change_board, 
   module Board_new,
   module Bonus,
) where

import Board_new
import Points
import Possible_permutations
import DictSearch
import Sort
import Change_board
import System.Random
import Data.List

randomChar :: Int->Char
randomChar x =  ['a'..'z'] !! (mod x 26) 

main = do   
    putStrLn "****************SCRABBLE*******************"
    putStrLn "Enter 1 to play 2 player game"
    putStrLn "Enter 2 to play with  me"
    line <- getLine  
    if null line  
        then return ()  
        else if line == "1"
                then do
                        game2Player initialBoard
                        return ()
                else
                     if line == "2"
                        then do gameWithComputer initialBoard
                                return ()
                        
                     else
                        do
                          putStrLn "wrong choice"
                          main
                          return()

game2Player initialBoard = do
        putStrLn "Enter 1 to display Board"
        putStrLn "Enter 2 to add a word to the existing Board"
        putStrLn "Enter 3 to start game "
        line <- getLine
        if null line
            then return ()
            else if line == "1"
                then do 
                        printBoard initialBoard
                        return ()
                else
                     if line == "2"
                        then do
                             putStrLn "Enter word to be added to the board"
                             word <- getLine
                             putStrLn "Enter coordinate of the starting index of the word ( (0,0) denotes \nthe top left box and (12,12) denotes the bottom right box"
                             coordinate <- getLine
                             putStrLn "Enter orientation (H for horizontal and V for vertical)"
                             orientation <- getLine
                            --  newboard = addWord initialBoard word coordinate orientation
                             game2Player newboard
                        else
                            do putStrLn "Form a word using the table and the following words"
                               printBoard initialBoard
                               putStrLn input
                               putStrLn "Enter your word : "
                               word <- getLine

gameWithComputer initialBoard = do
    putStrLn "Enter 1 to display Board"
    putStrLn "Enter 2 to add a word to the existing Board"
    putStrLn "Enter 3 to input letters for computer"
    line <- getLine
    if null line
        then return()
    else
        if line == "1"
            then do 
                printBoard initialBoard
                return ()
        else
            if line == "2"
                then do
                    putStrLn "Enter word to be added to the board"
                    word <- getLine
                    putStrLn "Enter coordinate of the starting index of the word ( (0,0) denotes \nthe top left box and (12,12) denotes the bottom right box"
                    coordinate <- getLine
                    putStrLn "Enter orientation (H for horizontal and V for vertical)"
                    orientation <- getLine
                    -- newboard = addWord initialBoard word coordinate orientation
                    game2Player newboard
                else
                    do 
                       putStrLn "Enter 7 letters for me to form a word"
                       letters <- getLine
                       if (length letters) /= 7
                            then do 
                                putStrLn "Game Over as you didn't enter 7 letters"
                       else 
                            return ()
                    --    form possible words , score calculation and adding word to Board 
                       return () 
                                 


                               

input:: IO ()
input = do
    num1 <- randomIO :: IO Int
    num2 <- randomIO :: IO Int
    num3 <- randomIO :: IO Int
    num4 <- randomIO :: IO Int
    num5 <- randomIO :: IO Int
    num6 <- randomIO :: IO Int
    num7 <- randomIO :: IO Int
    print $ [randomChar num1 , randomChar num2 , randomChar num3,randomChar num4,randomChar num5,randomChar num6,randomChar num7]

-- list of horizontal tuples , eg ((5,3),(8,3))
listOfTuplesH = [((a,b),(a,c)) | a <- [0..12] , b <- [0..12] , c <- [0..12], c - b > 1]
-- list of vertical tuples , eg (()) 
listOfTuplesV = [((b,a),(c,a)) | a <- [0..12] , b <- [0..12] , c <- [0..12], c - b > 1]
