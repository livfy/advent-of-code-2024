import Algorithms

struct Day01: AdventDay {
    var data: String

    var entities: [[Int]] {
        data.split(separator: "\n").map {
            $0.split(separator: "   ").compactMap { Int($0) }
        }
    }

    func part1() -> Any {
        print(entities)
        return 0
    }

    func part2() -> Any {
        return 0
    }
}