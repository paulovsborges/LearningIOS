import Cocoa


//var greeting = "Hello, playground"
//greeting = "dummy string"

//let cantChange = "cant change this one"
//
//var playerName = "Roy"
//print(playerName)
//
//playerName = "Dani"
//print(playerName)
//
//playerName = "Sam"
//print(playerName)
//
//let testText = """
//this
//is
//a
//dummy
//text
//"""
//
//print(testText.count)
//
//print(testText.uppercased())
//
//let fileName = "dummyImage.jpeg"
//
//print(fileName.hasPrefix("dummy"))
//print(fileName.hasSuffix("jpeg"))
//
//let bigNumber = 1_000_000_000
//print(bigNumber)
//
//
//let highNumber = 120
//print(highNumber.isMultiple(of: 3))


//var isAUthenticaded = false
//isAUthenticaded.toggle()
//print(isAUthenticaded)

//let testingQuote = """
//this is a
//\"DUMMY\"
//quote
//"""
//
//print(testingQuote)
//
//let name = "paulo"
//let age = 23
//let message = "I said that \"my name is \(name.uppercased()) and i`m \(age) years old\""
//print(message)

// ===== Checkpoint 1

// Convert Celsius to Fahrenheit

//let celsiusTemp = 32.0
//let fahrenheitTemp = ((celsiusTemp * 9) / 5) + 32
//let outputMessage = "Converting \(celsiusTemp)C° to \(fahrenheitTemp)F°"
//print(outputMessage)

// ==========================================================================================================
// ==========================================================================================================
//
//var beatles = ["John", "Paulo", "George", "Ringo"]
//beatles.append("Adrian")
//print(beatles)
//
//var scores = Array<Int>()
//scores.append(100)
//scores.append(80)
//print(scores[1])
//
////var albums = Array<String>()
////var albums = [String]()
//var albums = ["Folklore"]
//albums.append("Fearless")
//albums.append("Red")
//print(albums.count)
//
//var characters = ["Michael","Dwight", "Pam", "Jim"]
//print(characters.count)
//
//characters.remove(at: 2)
//print(characters.count)
//
//print("Is stanley still on the crew \(characters.contains("Stanley"))")
//
//characters.removeAll()
//print(characters.count)
//
//let letters = ["a", "c", "b", "d"]
//let sortedLetters = letters.sorted()
//let reversedLetters = letters.reversed()
//let shuffledLetters = letters.shuffled()
//print("sorted letters \(sortedLetters)")
//print("reversed letters \(reversedLetters)")
//print("shuffled letters \(shuffledLetters)")

//let resume = [
//    "name" : "Paulo",
//    "job" : "mobile developer",
//    "location": "Brazil"
//]
//
//print("Name : \(resume["name", default: "Unknown"])")
//print("Job : \(resume["job", default: "Unknown"])")
//print("Name : \(resume["location", default: "Unknown"])")
//
//var heights = [String : Int]()
//heights["Yao ming"] = 229
//heights["Shaquille"] = 216
//heights["Lebron"] = 206

//var theOfficeCrew = Set(["Michael","Dwight", "Pam", "Jim"])
//print(theOfficeCrew)
//theOfficeCrew.insert("Stanley")
//print(theOfficeCrew)

//enum WeekDay{
//    case monday,
//         tuesday,
//         wednesday,
//         thursday,
//         friday
//}
//
//var day = WeekDay.friday
//day = WeekDay.thursday
//day = .monday

//enum UiStyle{
//    case light, dark, system
//
//}
//
//let style : UiStyle
//style = .dark
//print(style)

// =========== checkpoint 2

//let letters = ["a", "b", "c", "d", "e", "f", "f"]
//let setOfLetters = Set(letters)
//print("Letters count \(letters.count)")
//print("Unique letters count \(setOfLetters.count)")

// ==========================================================================================================
// ==========================================================================================================
//

//let score = 69
//
//if score >= 70 {
//    print("Nice job")
//} else{
//    print("Try again")
//}
//
//let country = "Canada"
//
//if country != "Australia"{
//    print("Good day")
//}else{
//    print("Just a day")
//}
//
//let userName = "Paulo"
//
//if (userName.isEmpty) {
//    print("Name not valid")
//}else{
//    print("Hello \(userName)")
//}

//let temp = 25
//if(temp > 20 && temp < 30){
//    print("That is a nice weather")
//}
//
//let userAge = 14
//let hasParentConsent = true
//
//if(userAge >= 18 || hasParentConsent){
//    print("You can buy drugs")
//}

//enum TransportOption{
//    case airplane, helicpter, car, bike
//}
//
//let transport: TransportOption
//transport = .bike
//
//print(transport)
//
//switch transport {
//    case .airplane : "fly away"
//    case .bike : "Going to pedal"
//    case .car : "Zooooooooomm"
//    case .helicpter : "heliocoptero"
//}

//let city = "gotham"
//
//switch city {
//case "wakanda": print("we are in wakanda")
//case "gotham": fallthrough
//default : print("ondé q eu tô")
//}

//let age = 18
//
//
//// ternary operator -> what to check | what to output if true \ what to output if false
//let canVote = age >= 18 ? "yes" : "no"
//print(canVote)

//let platforms = ["iphone", "macbook", "tv", "watch"]
//
//for device in platforms{
//
//    print("Swift work well on \(device)")
//
//}

//for i in 1...12{
//    print("5 x \(i) is \(5 * i)")
//}

//for i in 1..<5{
//    print(i)
//}
//
//for _ in 1...5{
//    print("a ")
//}
//
//var count = 10
//
//while count > 0{
//    print(count)
//    count -= 1
//}
//
//print("finish")
//
//let id = Int.random(in: 1...1000)
//let amount = Double.random(in: 0...1)

//let fileNames = ["me.jpg", "work.txt", "lorena.jpg"]
//
//
//for file in fileNames{
//
//    if(!file.hasSuffix("jpg")){
//        continue
//    }
//
//    print("foudn \(file)")
//
//}

//var numbers = [Int]()
//
//for i in 1...100{
//
//    if(i % 2 != 0){
//        continue
//    }
//
//    numbers.append(i)
//
//    if(numbers.count == 20){
//        break
//    }
//}
//
//print(numbers)


// ========= checkpoint 3

//for i in 1...100{
//
//    if(i.isMultiple(of: 3) && i.isMultiple(of: 5)){
//        print("FizzBuzz")
//        continue
//    }
//
//    if(i.isMultiple(of: 3)){
//        print("Fizz")
//        continue
//    }
//
//    if(i.isMultiple(of: 5)){
//        print("Buzz")
//        continue
//    }
//
//    print(i)
//}


// ==========================================================================================================
// ==========================================================================================================

//func showWelcome(userName: String){
//    print("Welcome \(userName)")
//}
//
//showWelcome(userName: "Paulo")


//func rollDice() -> Int{
//    return Int.random(in: 1...1_000)
//}
//
//let bet = rollDice()
//print(bet)

//
//func areTheSame(letters1 : [String], letters2: [String]) -> Bool{
//    letters1.sorted() == letters2.sorted()
//}
//
//let areEquals = areTheSame(letters1: ["a", "b", "c"], letters2: ["b", "a", "c"])
//print(areEquals)

//func getUser () -> (firstName: String, lastName: String){
////    (firstName: "Paulo", lastName: "Borges")
////              OR
//    ("Paulo","Borges")
//}
//
//let (firstName, lastName) = getUser()
////                OR
//let (firstName, _) = getUser()
//print("\(firstName) - \(lastName)")
//
//func isEven(_ number: Int) -> Bool{
//    number % 2 == 0
//}
//
//let number = isEven(2)
//print(number)

//
//
//func fibonacci(first: Int, second: Int){
//
//    let result = first + second
//
//    print("\(first)+\(second)=\(result)")
//
//    if(result < 100){
//        fibonacci(first: second, second: result)
//    }
//}
//
//fibonacci(first: 0, second: 1)

// DAY 8 ===============================================
//func printTimesTable(number: Int, end : Int = 12){
//    for i in 1...end{
//        print("\(i) x \(number) = \(i * number)")
//    }
//}
//
//printTimesTable(number: 2)

//enum PasswordError: Error{
//    case short, obvious
//}
//
//func checkPassword(password: String) throws -> String{
//
//    if(password.count < 5){throw PasswordError.short}
//    if(password == "12345"){throw PasswordError.obvious}
//
//     if(password.count < 8){
//    return    "Ok"
//    }else if(password.count < 10){
//        return "Good"
//    }else{
//        return "Excellent"
//    }
//}
//
//do{
//    let result = try checkPassword(password: "12345asdasd")
//    print(result)
//}catch PasswordError.short{
//    print("too short")
//}catch PasswordError.obvious{
// print("too obvious")
//}catch{
//    print(error.localizedDescription)
//}
// CHECKPOINT 4 =============================================

//enum SquareError: Error{
//    case OutOfBounds, NoRoot
//}
//
//func getNextOddNumber(current: Int = 0) -> Int{
//
//    var result = current
//
//    repeat{
//       result += 1
//    }while(result % 2 == 0)
//
//    return result
//}
//
//func getSquareRoot(number: Int) throws -> Int{
//
//    if(number < 1 || number > 10000){
//        throw SquareError.OutOfBounds
//    }
//
//    var substractionsCount = 0
//    var oddNumber = 0
//    var finished = false
//    var numberSubstracted = number
//
//    repeat{
//
//        substractionsCount += 1
//
//        oddNumber = getNextOddNumber(current: oddNumber)
//
//        numberSubstracted = numberSubstracted - oddNumber
//
//        if(numberSubstracted < 0){
//            throw SquareError.NoRoot
//        }
//
//        if(numberSubstracted == 0){
//            finished = true
//        }
//    }while( finished == false )
//
//    return substractionsCount
//}
//
//let number = 81
//
//do{
//    let result = try getSquareRoot(number: number)
//    print("The square root of \(number) is \(result)")
//}catch SquareError.OutOfBounds {
//    print("\(number) is not in range")
//}catch SquareError.NoRoot {
//    print("No square root for \(number)")
//}catch{
//    print(error.localizedDescription)
//}

// CHECKPOINT 4 =============================================
// DAY 8 =====================================================

//DAY 9 ======================================================

//let clo = { (name: String) -> String in
//    "Hi \(name)"
//}
//
//let printtt = clo("sasd")
//print(printtt)

//let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

//let captainFirstTeam  = team.sorted(by: {(name1: String, name2: String) -> Bool in
//     if(name1 == "Suzanne"){
//         return true
//    } else if (name2 == "Suzanne"){
//        return false
//    }
//
//    return name1 < name2
//})
//
//let captainFirstTeam  = team.sorted {
//     if($0 == "Suzanne"){
//         return true
//    } else if ($1 == "Suzanne"){
//        return false
//    }
//
//    return $0 < $1
//}
//
//let captainFirstTeam = team.sorted{ $0 > $1}
//
//let captainFirstTeam  = team.sorted {a, b in
//     if(a == "Suzanne"){
//         return true
//    } else if (b == "Suzanne"){
//        return false
//    }
//
//    return a < b
//}
//
//print(captainFirstTeam)
//
//let tOnly = team.filter{ $0.hasPrefix("T")}
//print(tOnly)
//
//let upperCasedTeam = team.map{$0.uppercased()}
//print(upperCasedTeam)

//func makeArray(size: Int, using generator: () -> Int) -> [Int]{
//    var numbers = [Int]()
//
//    for _ in 0..<size{
//        let newNumber = generator()
//        numbers.append(newNumber)
//    }
//
//    return numbers
//}
//
//let rolls = makeArray(size: 50, using: {Int.random(in: 1...20)})
//print(rolls)

//func doImportantWork(first: () -> Void, second: () -> Void, third : () -> Void){
//    print("About to start first work")
//    first()
//    print("About to start second work")
//    second()
//    print("About to start third work")
//    third()
//    print("Done")
//}
//
//doImportantWork(
//first: {
//    print("First work")
//},
//second: {
//    print("Second work")
//},
//third: {
//    print("Third work")
//}
//)
// CHECKPOINT 5 =========================================

//let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
//let filterOutEvenNumbers = luckyNumbers.filter({number in
//    return number % 2 == 1
//})
//
//let ascendingOrder = filterOutEvenNumbers.sorted{$0 < $1}
//
//let interpolator = {(number: Int) -> String in
//    return "\(number) is a lucky number"
//}
//
//ascendingOrder.forEach{
//    print(interpolator($0))
//}

// CHECKPOINT 5 ====================
//DAY 9 =========================

// DAY 10 =========================
//struct Album{
//    let title: String
//    let artist: String
//    let year: Int
//
//    func printSummary(){
//        print("\(title) (\(year)) by \(artist)")
//    }
//}
//
//let red = Album(title: "Red", artist: "Taylor swift", year: 2012)
//let wings = Album(title: "Wings", artist: "BTS", year: 2016)
//
//print(red)
//print(wings)
//
//struct Employee{
//    let name: String
//    var vacationRemaining : Int
//
//    mutating func takeVacation(days: Int){
//        if(vacationRemaining > days){
//            vacationRemaining -= days
//            print("days remaining \(vacationRemaining)")
//        }else{
//            print("There aren`t enough days remaining")
//        }
//    }
//}
//
//var archer  = Employee(name: "Sterling archer", vacationRemaining: 14)
//archer.takeVacation(days: 5)
//print(archer.vacationRemaining)
//
//
//struct Employee2{
//    let name: String
//    var vacationAllocated = 14
//    var vacationTaken = 0
//
//    var vacationRemaining : Int{
//        get{
//            vacationAllocated - vacationTaken
//        }
//        set{
//            vacationAllocated = vacationTaken + newValue
//        }
//    }
//}
//
//var archer2 = Employee2(name: "Sterling archer")
//archer2.vacationTaken += 4
//archer2.vacationRemaining = 5
//print(archer2.vacationAllocated)
//

//struct Game{
//    var score = 0{
//        didSet{
//            print("Score is \(score)")
//        }
//    }
//}
//
//var game = Game()
//game.score += 10
//game.score += 3
//
//struct App{
//    var contacts = [String](){
//        willSet{
//            print("Current value is \(contacts)")
//            print("New value is \(newValue)")
//        }
//
//        didSet{
//            print("There are nown \(contacts.count) contacts")
//            print("Old value value was \(oldValue.count)")
//        }
//    }
//}
//
//var app = App()
//app.contacts.append("Shrek")
//app.contacts.append("Fiona")
//app.contacts.append("Burro")

//struct Player{
//    let name: String
//    let number: Int
//
//    init (name: String){
//        self.name = name
//        number = Int.random(in: 1...99)
//    }
//}
//
//let player = Player(name: "Megan R")
//print(player.number)


//DAY 10 =====================

//DAY 11 ===================================
//struct BankAccount{
//    private(set) var funds = 0
//
//    mutating func deposit(amount: Int){
//        funds += amount
//    }
//
//    mutating func withDraw(amount: Int) -> Bool{
//        if(funds > amount){
//            funds -= amount
//            return true
//        }else{
//            return false
//        }
//    }
//}
//
//var account = BankAccount()
//account.deposit(amount: 10)
//print(account.funds)

//struct School{
//    static var studentCount = 0
//
//    static func add(student: String){
//        print("\(student) joined the school")
//        studentCount += 1
//    }
//}
//
//School.add(student: "sdkfjksdjf")
//print(School.studentCount)

//struct AppData{
//    static let version = "1.3 beta"
//    static let fileName = "settings.json"
//    static let homeUrl = "https://www.settings.com"
//}
//
//print(AppData.version)
//
//struct Employee{
//    let userName: String
//    let password: String
//
//    static let example = Employee(userName: "sdfsdf", password: "ksdfjksdjf")
//}


// Checlpoint 6 ===============================

//enum ChangeGearError: Error{
//    case OutOfBounds, GearJump
//}
//
//struct Car{
//
//    let model: String
//    let numberOfSeats : Int
//
//    private (set) var currentGear = 1{
//        didSet{
//            print("My \(model) is now on \(currentGear)th gear")
//        }
//    }
//
//    private static func ensureNonNegativeNumber(number: Int) -> Int{
//        if(number < 0){
//            return number * -1
//        }else{
//            return number
//        }
//    }
//
//    mutating func changeGear(newGear: Int) throws -> Void{
//
//        if(newGear < 1 || newGear > 10){
//            throw ChangeGearError.OutOfBounds
//        }
//
//        let gearDifference = Car.ensureNonNegativeNumber(number: currentGear - newGear)
//
//        if(gearDifference > 1) {
//            throw ChangeGearError.GearJump
//        }
//
//        currentGear = newGear
//    }
//}
//
//var myCar = Car(model: "Mustang Mach One", numberOfSeats: 4)
//
//do{
//    try myCar.changeGear(newGear: 2)
//    try myCar.changeGear(newGear: 3)
//    try myCar.changeGear(newGear: 4)
//    try myCar.changeGear(newGear: 6)
//}catch ChangeGearError.OutOfBounds{
//    print("Gear out of range")
//}catch ChangeGearError.GearJump{
//    print("You should not jump gears")
//}catch{
//    print("Unknown error")
//}

// CHECKPOINT 6 ===============================
//DAY 11 ===================================

//DAY 12 ===================================


//class Game{
//    var score = 0 {
//        didSet{
//            print("Score is now \(score)")
//        }
//    }
//}
//
//var newGame = Game()
//newGame.score += 10
//
//
//class Employee{
//    let hours : Int
//
//    init(hours : Int){
//        self.hours = hours
//    }
//
//    func printSummary(){
//        print("I work \(hours) hours a day")
//    }
//}
//
//final class Developer : Employee{
//    func work(){
//        print("Coding for \(hours)")
//    }
//
//    override func printSummary() {
//        print("I code for \(hours) a day")
//    }
//}
//
//let dev = Developer(hours: 8)
//dev.work()
//dev.printSummary()
//
//class AmplitudeConverter{
//    let db: Float
//    let amplitude: Float
//    
//    init(db: Float, amplitude: Float) {
//        self.db = db
//        self.amplitude = amplitude
//    }
//    
//    func fromAmplitudeToDb() -> Float{
//        let result = 20.0 * log10(amplitude)
//        return round(result)
//    }
//    
//    func fromDbToAmplitude() -> Float{
//     return    pow(10.0, db / 20.0)
//    }
//}
//
//let converter = AmplitudeConverter(db: -30.0, amplitude: 0.0316228)
//let db = converter.fromAmplitudeToDb()
//let amplitude = converter.fromDbToAmplitude()
//
//print("\(converter.amplitude) in amplitude is equivalent to \(db) Db \n")
//print("\(converter.db) Db is equivalent to \(amplitude) in amplitude \n")

