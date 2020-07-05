
import Foundation

struct  DetailModel : Codable {
    
    let url: String?
    let date: String?
    let explanation: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case date = "date"
        case explanation = "explanation"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decode(String.self, forKey: .url)
        date = try values.decode(String.self, forKey: .date)
        explanation = try values.decode(String.self, forKey: .explanation)
        title = try values.decode(String.self, forKey: .title)
    }
   
    init()  {
       url = ""
       date = ""
       explanation = ""
       title = ""
    }
    
    public func encode(to encoder: Encoder) throws {
        //Implement when needed
    }
}
