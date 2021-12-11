//
//  Support.swift
//  AdventOfCode2021
//
//  Created by Ondřej Pišín on 08.12.2021.
//

import Foundation

protocol Executable {
    func execute()
}

func read(file: String) -> String {
    try! String(
        contentsOfFile: Bundle.main.path(forResource: file, ofType: "txt")!,
        encoding: String.Encoding.utf8
    )
}
