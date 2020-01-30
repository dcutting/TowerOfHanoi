import Foundation
import TowerOfHanoiLib

struct InputError: Error {}

func play() throws {
    print("How many discs? ", terminator: "")

    guard
        let input = readLine(),
        let discs = Int(input)
    else { throw InputError() }

    if discs > 10 {
        let count = pow(2, discs) - 1
        print("That takes \(count) moves!")
    } else {
        let moves = move(discs: discs, source: "A", target: "B", spare: "C")
        print(moves)
    }
}

print("Tower of Hanoi")

while true {
    do {
        try play()
    } catch {
        exit(0)
    }
}
