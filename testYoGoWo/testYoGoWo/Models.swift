import UIKit

final public class Session {
    
    /// This is the id of the Session
    public var serverId: String!
    
    /// Represents the beginning date
    public var date: Date!
    
    /// Represents the description of a session
    public var comments: String!
    
    /// Return the coordinates of a session
    public var coordinates: (longitude: Double?, latitude: Double?)?
    
    /// Represents the coach who set this session
    public var coach: Coach!
    
    /// Represents the type of this session
    public var type: SessionType?
    
    /// Represents the maximum number of persons
    public var maximumPersons: Int = 0
    
}

final public class SessionType: NSObject {
    
    /// This is the id of the Session Type
    public var serverId:                String!
    
    /// This is the text of the Session Type
    public var name:                    String!
    
    /// This is the text of the Session Type
    public var text:                    String!
    
    /// This is the image of the Session Type
    public var imageImage: UIImage?

}

final public class Coach: NSObject {
    
    /// This is the id of the Coach
    public var serverID: String?
    
    /// Represents the email address of the coach
    public var email:     String?
    
    /// Represents the firstname of the coach
    public var firstname: String?
    
    /// Represents the lastname address of the coach
    public var lastname:  String?

}
