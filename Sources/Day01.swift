import Algorithms

extension [Int] {
    var second: Int? {
        self[1]
    }
}

struct Day01: AdventDay {
    var data: String

    var locations: [[Int]] {
        data.split(separator: "\n").map {
            $0.split(separator: "   ").compactMap { Int($0) }
        }
    }

    func part1() -> Any {
        // split the locations into to two groups
        var left = locations.map { $0.first ?? 0 }
        var right = locations.map { $0.second ?? 0 }

        var totalDistance = 0

        // Find the smallest number and delete it from the list.
        // Repeat until all the elements are deleted from the list
        while left.count != 0 {
            var smallestLeftIndex = 0
            for index in 0..<left.count {
                if left[index] < left[smallestLeftIndex] {
                    smallestLeftIndex = index
                }
            }

            var smallestRightIndex = 0
            for index in 0..<right.count {
                if right[index] < right[smallestRightIndex] {
                    smallestRightIndex = index
                }
            }

            totalDistance += abs(left[smallestLeftIndex] - right[smallestRightIndex])

            left.remove(at: smallestLeftIndex)
            right.remove(at: smallestRightIndex)
        }
        return totalDistance
    }

    func part2() -> Any {
        let left = locations.map { $0.first ?? 0 }
        let right = locations.map { $0.second ?? 0 }

        var similarityScore = 0


        for location in left {
            let count = right.count {
                $0 == location
            }
            similarityScore += location * count
        }

        return similarityScore
    }
}
