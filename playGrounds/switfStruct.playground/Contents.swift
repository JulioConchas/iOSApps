// Defining the Structure
struct Town
{
    // Properties
    let name = "Zapopan"
    var citizens = ["Frangie", "Amlo"]
    var resources = ["Grain":100, "Ore":42, "Wool": 75]
    
    //add behavior for Structure
    // Methods
    func fortify()
    {
        print("Defences increased!")
    }
}

// Generic Structure
struct TownOne
{
    let name : String
    var citizens : [String]
    var resources : [String: Int]
    
    init(name: String, citizens : [String], resources: [String: Int])
    {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
}
// Initialising the Structure
var myTown = Town()

// print values of Structure
print(myTown.citizens)
print("\(myTown.name) has \(myTown.resources["Ore"]!) tons of Ore")

// modify values of Structure
myTown.citizens.append("Xhochitl")
print(myTown.citizens)

// call behavior
myTown.fortify()

// Creating a Gerenic Town
var anotherTown = TownOne(name: "Super Town", citizens: ["Superman","Batman","Wonderwoman"], resources: ["Money": 1000])

print(anotherTown.citizens)
anotherTown.citizens.append("Flash")
print(anotherTown.citizens)

print("Another challenge")

struct User
{
    var name : String
    var email : String?
    var followers : Int
    var isActive : Bool
    
    init(name: String, email: String?, followers: Int, isActive: Bool)
    {
        self.name = name;
        if email != nil
        {
            self.email = email
        }
        self.followers = followers
        self.isActive = isActive
    }
    func logStatus()
    {
        if isActive
        {
            print("\(self.name) is working hard")
        }
        else
        {
            print("\(self.name) has left earth")
        }
    }
    
}

// Initialise a User struct here
var rich = User(name: "Richard",email: nil,followers: 0, isActive: false)
rich.logStatus()



// Diagnostic code - do not change this code
print("\nDiagnostic code (i.e., Challenge Hint):")
var musk = User(name: "Elon", email: "elon@tesla.com", followers: 2001, isActive: true)
musk.logStatus()
print("Contacting \(musk.name) on \(musk.email!) ...")
print("\(musk.name) has \(musk.followers) followers")
// sometime later
musk.isActive = false
musk.logStatus()



