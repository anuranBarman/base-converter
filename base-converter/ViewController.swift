//
//  ViewController.swift
//  base-converter
//
//  Created by admin on 07/09/21.
//

import Cocoa

class ViewController: NSViewController,NSTextFieldDelegate {

    
    @IBOutlet weak var resultLabel: NSTextField!
    @IBOutlet weak var headerLabel: NSTextField!
    @IBOutlet weak var segmentedControl: NSSegmentedControl!
    
    @IBOutlet weak var textField: NSTextField!
    
    
    var base = BASE.HEX
    var conversion = CONVERSION.DEC_TO_HEX
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.textField.delegate = self
        self.segmentedControl.selectedSegment = 0
        self.resultLabel.stringValue = ""
        self.headerLabel.stringValue = "Hex Equivalent :"
        self.textField.placeholderString = "Enter your Decimal number"
        
    }


    @IBAction func convertTapped(_ sender: NSButton) {
        self.convert()
    }
    
    func convert(){
        if self.textField.stringValue.isEmpty {
            return
        }
        switch self.base {
        case .HEX:
            if self.conversion == .DEC_TO_HEX {
                if let number = Int(self.textField.stringValue) {
                    self.resultLabel.stringValue = String(number,radix: 16)
                }
            }else {
                if let number = UInt64(self.textField.stringValue,radix: 16) {
                    self.resultLabel.stringValue = "\(number)"
                }
            }
            break
        case .BINARY:
            if self.conversion == .DEC_TO_BIN {
                if let number = Int(self.textField.stringValue) {
                    self.resultLabel.stringValue = String(number,radix: 2)
                }
            }else {
                if let number = UInt64(self.textField.stringValue,radix: 2) {
                    self.resultLabel.stringValue = "\(number)"
                }
            }
            break
        }
        
    }
    
    @IBAction func segmentChanged(_ sender: NSSegmentedControl) {
        if sender.selectedSegment == 0 {
            self.headerLabel.stringValue = "Hex Equivalent :"
            self.base = .HEX
            self.conversion = .DEC_TO_HEX
            self.textField.placeholderString = "Enter your Decimal number"
        }else {
            self.headerLabel.stringValue = "Binary Equivalent :"
            self.base = .BINARY
            self.conversion = .DEC_TO_BIN
            self.textField.placeholderString = "Enter your Decimal number"
        }
        
        self.resultLabel.stringValue = ""
        self.textField.stringValue = ""
    }
    
    @IBAction func swapTapped(_ sender: NSButton) {
        if self.base == .HEX {
            if self.conversion == .DEC_TO_HEX {
                self.conversion = .HEX_TO_DEC
                self.textField.placeholderString = "Enter your Hex number"
                self.headerLabel.stringValue = "Decimal Equivalent :"
            }else {
                self.conversion = .DEC_TO_HEX
                self.textField.placeholderString = "Enter your Decimal number"
                self.headerLabel.stringValue = "Hex Equivalent :"
            }
        }else if self.base == .BINARY {
            if self.conversion == .DEC_TO_BIN {
                self.conversion = .BIN_TO_DEC
                self.textField.placeholderString = "Enter your Binary number"
                self.headerLabel.stringValue = "Decimal Equivalent :"
            }else {
                self.conversion = .DEC_TO_BIN
                self.textField.placeholderString = "Enter your Decimal number"
                self.headerLabel.stringValue = "Binary Equivalent :"
            }
        }
        self.resultLabel.stringValue = ""
        self.textField.stringValue = ""
    }
    
    func controlTextDidEndEditing(_ obj: Notification) {
        self.convert()
    }
    
}


enum BASE {
    case HEX, BINARY
}

enum CONVERSION {
    case DEC_TO_HEX,HEX_TO_DEC,DEC_TO_BIN,BIN_TO_DEC
}
