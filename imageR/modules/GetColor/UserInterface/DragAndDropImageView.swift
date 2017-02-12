//
//  DragAndDropImageView.swift
//  DominantColor
//
//  Created by Indragie on 12/19/14.
//  Copyright (c) 2014 Indragie Karunaratne. All rights reserved.
//

import Cocoa

@objc protocol DragAndDropImageViewDelegate {
    func dragAndDropImageView(imageView: DragAndDropImageView, droppedImage image: NSImage?)
}

class DragAndDropImageView: NSImageView {
    
    @IBOutlet weak var delegate: DragAndDropImageViewDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        register(forDraggedTypes: [NSFilenamesPboardType, NSTIFFPboardType])
    }
    
    // MARK: NSDraggingDestination
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        let pasteboard = sender.draggingPasteboard()
        if let data = pasteboard.data(forType: NSTIFFPboardType) {
            return .copy
        } else if let files = pasteboard.propertyList(forType: NSFilenamesPboardType) as? [String] {
            return .copy

//            print("files: \(files)")
//            let UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, files[0].pathExtension as CFString, nil)?.takeRetainedValue()
//            return (UTTypeConformsTo(UTI!, kUTTypeImage) == true) ? .copy : []
        }
        return []
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        let pasteboard = sender.draggingPasteboard()
        if let data = pasteboard.data(forType: NSTIFFPboardType) {
            self.delegate?.dragAndDropImageView(imageView: self, droppedImage: NSImage(data: data))
        } else if let files = pasteboard.propertyList(forType: NSFilenamesPboardType) as? [String] {
            self.delegate?.dragAndDropImageView(imageView: self, droppedImage: NSImage(contentsOfFile: files[0]))
        }
        return true
    }
}
