//
//  noteController.swift
//  bibin_c0769970_Note_p1
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//



import Foundation

import UIKit

protocol noteControllerDelegate: class
{
    // note editing and adding functions
    func addedNotes(note: String)
    func editedNotes(note: String, index: Int)
}

class noteController: UIViewController
{
    var note = String()
   
    
    @IBOutlet weak var noteview: UITextView!
    
    weak var delegate: noteControllerDelegate?
    var isToEdit = false
    var index = Int()
 override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.noteview.text = note
        self.noteview.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        guard let text = noteview.text, !text.isEmpty else
        {
            return
        }
        
        if isToEdit
        {
            self.delegate?.editedNotes(note: text, index: index)
        }
        else
        {
            self.delegate?.addedNotes(note: text)
        }
    }
    
    
    
    
}
