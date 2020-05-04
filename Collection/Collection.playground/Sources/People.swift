public struct People {
    public var name:String = ""
    public var age:Int = 0
}
let somePeopleData = [
["name":"张三","age":18],
["name":"李四","age":20],
["name":"王二","age":25]
]
public var somePeople:[People] {
    get {
        var peoples = [People]()
        for item in somePeopleData {
            let people = People(name:item["name"] as! String,age:item["age"] as! Int)
            peoples.append(people)
        }
        return peoples
    }
}

