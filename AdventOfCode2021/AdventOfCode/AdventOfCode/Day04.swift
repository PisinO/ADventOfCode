//
//  Day04.swift
//  AdventOfCode
//
//  Created by Ondrej Pisin on 12.12.21.
//

import Foundation

class Day04: Executable {
    
    let boardSize = 5
    
    class Board {
        let rows: [[String.SubSequence]]
        var columns: [[String.SubSequence]] {
            var final = [[String.SubSequence]]()
            for i in 0..<rows[0].count {
                var c = [String.SubSequence]()
                for j in 0..<rows.count {
                    c.append(rows[j][i])
                }
                final.append(c)
            }
            return final
        }
        private var checkedNumbers = Set<String.SubSequence>()

        init(rows: [[String.SubSequence]]) {
            self.rows = rows
        }
        
        func check(_ num: String.SubSequence) -> Bool {
            checkedNumbers.insert(num)
            let rows = rows.map({ Set($0) })
            let columns = columns.map({ Set($0) })
            let rowsChecked = !rows.map({ $0.isSubset(of: checkedNumbers) }).allSatisfy({ !$0 })
            let columnsChecked = !columns.map({ $0.isSubset(of: checkedNumbers) }).allSatisfy({ !$0 })
            return rowsChecked || columnsChecked
        }
        
        func sum() -> Int {
            Set(rows.flatMap({ $0 }))
                .subtracting(checkedNumbers)
                .map({ Int($0)! })
                .reduce(0, +)
        }
    }
    
    func execute() {
        p1()
        p2()
    }
    
    private func p1() {
        let chunks = read(file: "input04").split(separator: "\n")
        let moves = chunks[0].split(separator: ",")
        let boards = chunks[1..<chunks.count]
            .map({ $0 })
            .chunked(into: boardSize)
            .map({ rows in
                Board(rows: rows.map({ row in
                    row.split(separator: " ")
                }))
            })
        
        for move in moves {
            for board in boards {
                if board.check(move) {
                    print("P1: \(Int(move)! * board.sum())")
                    return
                }
            }
        }
    }
    
    private func p2() {
        let chunks = read(file: "input04").split(separator: "\n")
        let moves = chunks[0].split(separator: ",")
        let boards = chunks[1..<chunks.count]
            .map({ $0 })
            .chunked(into: boardSize)
            .map({ rows in
                Board(rows: rows.map({ row in
                    row.split(separator: " ")
                }))
            })
        
        var winIndexes = Set<Int>()
        moves.forEach { move in
            boards.enumerated().forEach { index, board in
                if !winIndexes.contains(index), board.check(move) {
                    print("Index \(index) Board \(index) checked with move \(move) - sum \(board.sum())")
                    winIndexes.insert(index)
                    if winIndexes.count == boards.count {
                        let l = board.sum()
                        print("P2: \(Int(move)! * board.sum())")
                        return
                    }
                }
            }
        }
    }
}
