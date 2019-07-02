
import Foundation

struct ExperienceCellPresenter {
    //MARK: - Properties
    var company: String
    var start: String
    var end: String
    var designation: String
    var formatedInfo: String {
        return  "\(start) - \(end)  \(designation)"
    }
}
