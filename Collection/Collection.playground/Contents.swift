import UIKit

/* Arrays
	值语义
 */

//
//create
//

let someInts:Array = [Int]() // 不可变
var someString = [String]() // 可变的
someString.append("😃")
// 创建有默认值数组
var threesDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var shoppingList = ["Eggs","Milk"]

//
// 访问和修改
//
shoppingList.count
shoppingList.isEmpty
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread","Cheese","Butter"]
var firstItem = shoppingList[0]
shoppingList[0] = "Six Eggs"
// 改变了数组的大小， 执行后长度从 7 变为 6
shoppingList[4...6] = ["Bananas","Apples"]
shoppingList.insert("Maple Syrup", at: 0)
shoppingList.remove(at: 0)
// removeLast  需要集合不为 空，为 空 crash
shoppingList.removeLast()

//
//迭代
//
for item in shoppingList {
    print(item)
}
for (index,value) in shoppingList.enumerated() {
    print("Item \(index + 1) : \(value)")
}

/*
  Set
 值语义
 
 类型必须是 hashable 的，也就是可以比较的 ==  a.hashValue == b.hashValue
 满足 hashable 的类型有：
 	1. 基础类型 String、Int、Double、Bool、Character
 	2. 没有关联值 的 enmu case 值
 	3. 实现了 hashable 协议的自定义类型
 */

//
// 创建和初始化
//
var letters = Set<Character>()
letters.insert("a")
letters = []
var favoriteGenres:Set = ["Rock","Classical","Hip hop"]

//
//  访问和修改
//
favoriteGenres.count
favoriteGenres.isEmpty
favoriteGenres.insert("Jazz")
if let removedGenre = favoriteGenres.remove("Rock") {
    print(removedGenre)
}else{}
if favoriteGenres.contains("Funk"){
    print("I get up on the good foot")
}else{}

//
//迭代
//
for genre in favoriteGenres {
    print(genre)
}

for genre in favoriteGenres.sorted() {
    print(genre)
}

//
// 应用
//
/*
 intersection(_:) 返回 计算两个 set 的交集的新set
 symmetricDifference(_:) 返回 计算两个 set 的除交集外的新 set
 union(_:) 返回 计算两个 set 的全集 set
 subtracting(_:) 返回 不在参数 set 内元素的新 set
 */

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

/**
 isSubset(of:)  是否 set 所有值都包含在目标 set 内
 isSuperset(of:) 是否 set 包含目标 set 的所有值
 isStrictSubset(of:) 除了包含关系外，和目标 set 不相等
 isStrictSuperset(of:) 除了包含关系外，和目标 set 不相等
 isDisjoint(with:) 是否 set 和目标 set 没有相同的值
 */

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
houseAnimals.isDisjoint(with: cityAnimals)

/**
 Dictionary
值语义

类型必须是 hashable 和 set 的值类型一样
*/
	
//
// 创建
//
var namesOfIntegers = [Int:String]()
var airports = ["YYZ":"Toronto Person","DUB":"Dublin"]

//
// 访问和修改
//
airports.count
airports.isEmpty
airports["LHR"] = "London"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print(oldValue)
}

if let airportName = airports["DUB"] {
    print(airportName)
}
airports["APL"] = "Apple International"
airports["APL"] = nil

if let removeValue = airports.removeValue(forKey: "DUB"){
    print(removeValue)
}

airports.keys
airports.values

