/*: ## Home Work (Домашняя работа) */
//:


import Foundation


// 1.1. Для структуры Point перегрузить операторы: -, -=, prefix —, postfix —, /, /=, *=
struct Point {
    var x: Int
    var y: Int
}

// 1.1.1.
func - (pointLeft: Point, pointRight: Point) -> Point {
    return Point(x: pointLeft.x - pointRight.x, y: pointLeft.y - pointRight.y)
}

let point1 = Point(x: 5, y: -9)
let point2 = Point(x: -3, y: 1)
var pointResult = point1 - point2

print("1.1.1. Result operator function '-' is \(pointResult)")


// 1.1.2.
func -= (inout pointLeft: Point, pointRight: Point) {
    pointLeft = pointLeft - pointRight
}

pointResult -= point2

print("1.1.2. Result operator function '-=' is \(pointResult)")


// 1.1.3.
prefix func - (point: Point) -> Point {
    return Point(x: -point.x, y: -point.y)
}

print("1.1.3. Result operator function 'prefix -' is \(-pointResult)")


// 1.1.4.
postfix func -- (point: Point) -> Point {
    return Point(x: point.x - 1, y: point.y - 1)
}

print("1.1.4. Result operator function 'postfix --' is \(pointResult--)")


// 1.1.5.
func / (pointLeft: Point, pointRight: Point) -> Point {
    return Point(x: pointLeft.x / pointRight.x, y: pointLeft.y / pointRight.y)
}

print("1.1.5. Result operator function '/' is \(point1 / point2)")


// 1.1.6.
func /= (inout pointLeft: Point, pointRight: Point) {
    pointLeft = Point(x: pointLeft.x / pointRight.x, y: pointLeft.y / pointRight.y)
}

pointResult /= point2

print("1.1.6. Result operator function '/=' is \(pointResult)")


// 1.1.7.
func *= (inout pointLeft: Point, pointRight: Point) {
    pointLeft = Point(x: pointLeft.x * pointRight.x, y: pointLeft.y * pointRight.y)
}

pointResult *= point2

print("1.1.7. Result operator function '*=' is \(pointResult)")
print()



// 1.2. Создать структуру Rect, аналог CGRect, содержащую структуры Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.
struct Size {
    var width: Float
    var height: Float
}

struct Rect {
    var size: Size
    var point: Point
}

// 1.2.1. +

func + (sizeLeft: Size, sizeRight: Size) -> Size {
    return Size(width: sizeLeft.width + sizeRight.width, height: sizeLeft.height + sizeRight.height)
}

func + (pointLeft: Point, pointRight: Point) -> Point {
    return Point(x: pointLeft.x + pointRight.x, y: pointLeft.y + pointRight.y)
}

func + (rectLeft: Rect, rectRight: Rect) -> Rect {
    return Rect(size: rectLeft.size + rectRight.size, point: rectLeft.point + rectRight.point)
}

var rect1 = Rect(size: Size(width: 3.1, height: 5.89), point: Point(x: 2, y: 7))
let rect2 = Rect(size: Size(width: 1.66, height: -2.14), point: Point(x: 0, y: 4))

print("1.2. Original\n rect1 = \(rect1)\n rect2 = \(rect2)\n")
print("1.2.1. Result operator function '+' is \(rect1 + rect2)")


// 1.2.2 +=
func += (inout rectLeft: Rect, rectRight: Rect) {
    rectLeft = rectLeft + rectRight
}

rect1 += rect2

print("1.2.2. Result operator function '+=' is \(rect1)")


// 1.2.3. -
func - (sizeLeft: Size, sizeRight: Size) -> Size {
    return Size(width: sizeLeft.width - sizeRight.width, height: sizeLeft.height - sizeRight.height)
}

func - (rectLeft: Rect, rectRight: Rect) -> Rect {
    return Rect(size: rectLeft.size - rectRight.size, point: rectLeft.point - rectRight.point)
}

print("1.2.3. Result operator function '-' is \(rect2 - rect1)")


// 1.2.4.
func -= (inout rectLeft: Rect, rectRight: Rect) {
    rectLeft = rectLeft - rectRight
}

rect1 -= rect2

print("1.2.4. Result operator function '-=' is \(rect1)")
print()



// 1.3. Перегрузить оператор + и += для String, но второй аргумент должен быть Int
// 1.3.1.
func + (left: String, right: Int) -> String {
    return left + String(right)
}

print("1.3.1. \("adadAsdasDASdasD dasDSAD - " + 69)")


// 1.3.2.
func += (inout left: String, right: Int) {
    left = left + right
}

var str = "adadAsdasDASdasD dasDSAD - "
str += 96

print("1.3.2. \(str)")
print()



// 1.4. Создать свой оператор, который будет принимать две String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы
func /= (inout leftString: String, rightString: String) {
    let maxLength = leftString.characters.count >= rightString.characters.count ? rightString.characters.count : leftString.characters.count
    let substringTmp = leftString.substringToIndex(leftString.startIndex.advancedBy(maxLength))
    
    for (index, char) in substringTmp.characters.enumerate() where char == rightString.characters[rightString.startIndex.advancedBy(index)] {
        leftString.replaceRange(Range(leftString.startIndex.advancedBy(index)..<leftString.startIndex.advancedBy(index + 1)), with: String(char).uppercaseString)
    }
}

var str1 = "kjhkjh fajDFha hwyriu   uq;kjJ _ss_fasfdfsdfsf kh jkahsd jkah"
let str2 = "kjslkfua jA hJJswyrHF_JSDqFJHSDDsswiqeiwqevcvv  jssjdfjsdhfahsdjfh"

str1 /= str2

print("1.4. Result string: \(str1)")
