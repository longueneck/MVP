import Foundation

protocol PresenterProtocol {
    func generateButtonTapped()
}

class Presenter: PresenterProtocol {
    private let responseModel: ResponseModel
    private weak var responseView: ViewProtocol?
    private let service: Service = Service()
    
    init(model: ResponseModel, view: ViewProtocol) {
        self.responseModel = model
        self.responseView = view
    }
    
    func generateButtonTapped() {
        service.generateRecipe(message: String.finalPharse) { response, error in
            if let responseText = response {
                let responseAPIText = responseText.choices.first?.message.content ?? ""
                self.responseView?.updateResponseText(text: responseAPIText)
            } else {
                debugPrint(error ?? "")
            }
        }
    }
}
