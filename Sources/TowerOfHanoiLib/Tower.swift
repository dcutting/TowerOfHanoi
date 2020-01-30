public func move(discs: Int, source: String, target: String, spare: String) -> [(String, String)] {

    guard discs > 0 else { return [] }

    guard discs != 1 else { return [(source, target)] }

    let top = discs - 1
    
    let topToSpare = move(discs: top, source: source, target: spare, spare: target)
    let baseToTarget = move(discs: 1, source: source, target: target, spare: spare)
    let topToTarget = move(discs: top, source: spare, target: target, spare: source)

    return topToSpare + baseToTarget + topToTarget
}
