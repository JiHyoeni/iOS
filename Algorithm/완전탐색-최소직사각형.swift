import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var maxWidth = 0
    var maxHeight = 0
    let amount = sizes.map ({ (value: [Int]) -> [Int] in
        var returnVal: [Int] = []
        if value[0] < value[1] {
            let width = value[1]
            let height = value[0]
            returnVal = [width, height]
        } else {
            returnVal = value
        }
        if returnVal[0] > maxWidth { maxWidth = returnVal[0] }
        if returnVal[1] > maxHeight { maxHeight = returnVal[1] }
        return returnVal
    })
    return maxWidth * maxHeight
}

