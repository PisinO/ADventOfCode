//
//  main.swift
//  AdventOfCode2021
//
//  Created by Ondřej Pišín on 08.12.2021.
//

import Foundation

let days: [Executable] = [
    Day01(),
    Day02(),
    Day03()
]

days.forEach { day in
    print("---------------\(day.self)---------------")
    day.execute()
}
