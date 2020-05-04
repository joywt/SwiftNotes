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
shoppingList.append(contentsOf: ["Strawberry","watermelon"])
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


/**
 数组更多
 1. 数组变形
 2. 数组类型（切片、桥接）
 */

/**
 map 和 flatMap  如何对元素进行变换
 filter  元素是否应该被包含在结果中
 reduce  如何将元素合并到一个总和的值中
 sequence 序列中下一个元素应该是什么
 forEach  对于一个元素，应该执行怎么的操作
 sort， lexicographicCompare 和 partition  两个元素应该以怎样的顺序进行排序
 index， first 和 contains  元素是否符合某个条件
 min 和 max  两个元素中的最大值、最小值是哪个
 elementsEqual 和 starts  两个元素是否相等
 split  这个元素是否是一个分割符
 */

let fibs = [0,1,1,2,3,5]
let squares = fibs.map{fib in fib * fib}

let youngPeople =  somePeople.filter { people -> Bool in
    return people.age < 20
}
youngPeople

let squaresCount = squares.reduce(0) { (total, number)  in
    return total + number
}

let suits = ["♠️","♦️","♥️","♣️"]
let ranks = ["J","Q","K","A"]

let result = suits.flatMap { suit in
    ranks.map { rank in
        (suit,rank)
    }
}

fibs.forEach { number in
    print(number)
}

var numbers = [3,14,5,534,23,13,45,8,19,20,23]
numbers.sort()
numbers.sort {$0>$1}
numbers.lexicographicallyPrecedes([1,2,3])
let p = numbers.partition { $0 > 45}
let first = numbers[..<p]
let last = numbers[p...]
numbers
numbers.index(after: 0)
numbers.first
numbers.contains(45)
numbers.elementsEqual([13,3,4])
numbers.starts(with: [3,14,5])

