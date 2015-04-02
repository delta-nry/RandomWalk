//
//  main.swift
//  Random Walk
//
//  Copyright 2015 Nathan Robert Yee
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Darwin

let boardSize = 9

var board = ["_"]
for i in 0..<boardSize - 1 {
    board.append("_")
}

board.insert("@", atIndex: Int((board.count)/2))
println(board.description)
sleep(1)

/**
Move "@" right one place. Return argument if the last element of the
Array is "@".

Examples:
["_", "@", "_"] -> ["_", "_", "@"]
["_", "_", "@"] -> ["_", "_", "@"]
*/
func moveRight(board: [String]) -> [String] {
    for var index = 0; index < board.count; ++index {
        if board[index] == "@" {
            var newBoard = ["_"]
            for i in 0..<board.count - 2 {
                newBoard.append("_")
            }
            if index + 1 < board.count {
                newBoard.insert("@", atIndex: index + 1)
                return newBoard
            } else {
                return board
            }
        }
    }
    return ["X"]
}

/**
Move "@" left one place. Return argument if the first element of the
Array is "@".

Examples:
["_", "@", "_"] -> ["@", "_", "_"]
["@", "_", "_"] -> ["@", "_", "_"]
*/
func moveLeft(board: [String]) -> [String] {
    for var index = 0; index < board.count; ++index {
        if board[index] == "@" {
            var newBoard = ["_"]
            for i in 0..<board.count - 2 {
                newBoard.append("_")
            }
            if index - 1 >= 0 {
                newBoard.insert("@", atIndex: index - 1)
                return newBoard
            } else {
                return board
            }
        }
    }
    return ["X"]
}

while true {
    let randNum = Int(arc4random_uniform(2))
    if randNum % 2 == 0 {
        board = moveRight(board)
        println(board.description)
    } else {
        board = moveLeft(board)
        println(board.description)
    }
    sleep(1)
}

