import UIKit

var number : Int = 25

switch number {
    case 0..<25 :
        print("25미만의 숫자")
    case 0...25 :
        print("25이하의 숫자")
    default :
        print("25보다 큰 숫자")
}
