//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
var lottoDictionary: Dictionary<String, Set<Int>> = [:]
var index = 0

func showedLottoNumbers() -> Set<Int> {
    var lottoNumbers: Set<Int> = []
    while lottoNumbers.count < 6 {
        lottoNumbers.insert(Int.random(in: 1...45))
    }
    lottoScore(score: lottoNumbers)
    return lottoNumbers
}

func lottoScore(score: Set<Int>) {
    index += 1
    lottoDictionary["\(index)회차의"] = score
}
    
func matchedWinningNumber() {
    let myLottoNumbers: [Int] = [1, 2, 3, 4 ,5, 6]
    let matchedLottoNumbers = showedLottoNumbers().intersection(myLottoNumbers)
    if matchedLottoNumbers.isEmpty {
        print("아쉽지만 겹치는 번호가 없습니다.")
    } else {
        print("축하합니다! 겹치는 번호는 \(convertedSetTypeByString(set: matchedLottoNumbers)) 입니다 ! ")
    }
}

func convertedSetTypeByString(set: Set<Int>) -> String {
    let sorted = set.sorted()
    var result: [String] = []
    for number in sorted {
        result.append(String(number))
    }
    return  result.joined(separator: ", ")
}

func winnerNumberByRound(index: Int) {
    
    if let randomLottoNumbers: Set<Int> = lottoDictionary["\(index)회차의"] {
        print("\(index)회차의 로또 당첨 번호는 \(convertedSetTypeByString(set: randomLottoNumbers)) 입니다.")
    }
}

func pickingLottoNumbers(index: Int) {
for _ in 1...index {
    matchedWinningNumber()
    }
}

pickingLottoNumbers(index: 5)
winnerNumberByRound(index: 2)
print(lottoDictionary)
