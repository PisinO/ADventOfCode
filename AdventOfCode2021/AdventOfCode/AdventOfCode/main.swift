//
//  main.swift
//  AdventOfCode
//
//  Created by Ondrej Pisin on 11.12.21.
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
