import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let a = [1,2,3,4,5]
    let b = [2,1,2,3,2,4,2,5]
    let c = [3,3,1,1,2,2,4,4,5,5]
    var score = [0,0,0]
    var answer: [Int] = []
    var winnerScore = 0
    answers.enumerated().forEach {
        if $0.element == a[($0.offset % a.count)] {
            score[0] += 1
        }
        if $0.element == b[($0.offset % b.count)] {
            score[1] += 1
        }
        if $0.element == c[($0.offset % c.count)] {
            score[2] += 1
        }
    }
    // print("score: \(score)")
    score.enumerated().forEach {
        if winnerScore < $0.element {
            winnerScore = $0.element
            answer.removeAll()
            answer.append($0.offset + 1)
        } else if winnerScore == $0.element {
            answer.append($0.offset + 1)
        }
    }
    // print("answer:\(answer)")
    return answer
}

//
func solution(_ answers:[Int]) -> [Int] {
    let answer = (
        a: [1, 2, 3, 4, 5], // index % 5
        b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
    )
    var point = [1:0, 2:0, 3:0]

    for (i, v) in answers.enumerated() {
        if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
        if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
        if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
    }

    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
}
