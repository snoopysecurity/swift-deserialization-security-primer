
import Foundation

class Employee: NSObject, NSSecureCoding {
    
    public static var supportsSecureCoding = true
    var name: String
    var role: String
    
    init(name: String, role: String) {
        self.name = name
        self.role = role
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: "name") as? String,
              let role = aDecoder.decodeObject(forKey: "role") as? String else {
            return nil
        }
        
        self.init(name: name, role: role)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(role, forKey: "role")
    }
}


print("Enter path to serialized file:")
if let input = readLine() {
    // Use the input here
    print("You entered: \(input)")
    
    if let unarchivedPerson = NSKeyedUnarchiver.unarchiveObject(withFile: input) as? Employee {
        print("Name: \(unarchivedPerson.name), Role: \(unarchivedPerson.role)")
    } else {
        print("Failed to unarchive Employee object")
    }
    
} else {
    print("No input provided")
}



/* if you want to create an archive with an exploit
let gadget = ExampleGadget(command: "ls")
let fileURL2 = URL(fileURLWithPath: "/tmp/file2")
NSKeyedArchiver.archiveRootObject(gadget, toFile: "/tmp/exploit.data")
 */

