//
//  ViewController.swift
//  LUAutocompleteViewExample
//
//  Created by Laurentiu Ungur on 24/04/2017.
//  Copyright © 2017 Laurentiu Ungur. All rights reserved.
//

import UIKit
import LUAutocompleteView

final class ViewController: UIViewController {
    // MARK: - Properties

    @IBOutlet weak var textField: UITextField!
    private let autocompleteView = LUAutocompleteView()

    private let elements = (1...100).map { "\($0)" }
    let stuff: [Bla] = {
         return (1...100).map { Bla.init(name: "\($0)name", blaId: $0) }
    }()

    // MARK: - ViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(autocompleteView)

        autocompleteView.textField = textField
        autocompleteView.dataSource = self
        autocompleteView.delegate = self

        // Customisation

        autocompleteView.rowHeight = 45
        //autocompleteView.autocompleteCell = CustomAutocompleteTableViewCell.self // Uncomment this line in order to use customised autocomplete cell
    }
}

// MARK: - LUAutocompleteViewDataSource

extension ViewController: LUAutocompleteViewDataSource {
    func autocompleteView(_ autocompleteView: LUAutocompleteView, elementsFor text: String, completion: @escaping ([LUAutocompletable]) -> Void) {
        let elementsThatMatchInput = stuff.filter { $0.name.lowercased().contains(text.lowercased()) }
        completion(elementsThatMatchInput)
    }
}

// MARK: - LUAutocompleteViewDelegate

extension ViewController: LUAutocompleteViewDelegate {
    func autocompleteView(_ autocompleteView: LUAutocompleteView, didSelect object: LUAutocompletable) {
        print(object.textForField() + " was selected from autocomplete view")
        if let myBla = object as? Bla {
            print("bla with ID: \(myBla.blaID)")
        }
    }
}

class Bla: LUAutocompletable {
    
    var name: String
    var blaID: Int
    
    init(name: String, blaId: Int) {
        self.name = name
        self.blaID = blaId
    }
    
    func textForField() -> String {
        return name
    }
}
