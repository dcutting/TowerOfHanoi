import Foundation
import TowerOfHanoiLib

func play() -> Bool {
    print("How many discs? ", terminator: "")

    guard let input = readLine() else { return false }
    guard let discs = Int(input) else { return false }

    if discs > 10 {
        let count = pow(2, discs) - 1
        print("That takes \(count) moves!")
        return true
    }

    let moves = move(discs: discs, source: "A", target: "B", spare: "C")
    print(moves)
    return true
}

print("Tower of Hanoi")

var isPlaying = true
while isPlaying {
    isPlaying = play()
}
