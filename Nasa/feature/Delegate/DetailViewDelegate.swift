import Foundation

protocol DetailViewDelegate: class {
    func didSelectItem(item : DetailModel)
    func filterData(word : String)
}
