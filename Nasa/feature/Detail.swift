
import Foundation

struct  DetailModel : Codable {
    
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decode(String.self, forKey: .url)
    }
    
    public func encode(to encoder: Encoder) throws {
        //Implement when needed
    }
}
