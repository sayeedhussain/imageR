//
//  ViewController.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 26/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    private let ImageViewWidth: CGFloat = 450
    private let ImageViewHeight: CGFloat = 450

    @IBOutlet fileprivate weak var imageView: DragAndDropImageView!
    @IBOutlet fileprivate weak var tableView: NSTableView!
    @IBOutlet private weak var actionBtn: NSButton!

    @IBOutlet private weak var tagsTxtFld: NSTextField!
    @IBOutlet private var notesTxtView: NSTextView!
    
    fileprivate var colors: [NSColor] = Array(repeating: NSColor(calibratedWhite: 0.9, alpha: 1.0), count: 3)
    
    override func awakeFromNib() {
        
        self.setBackgroundColor(AppColors.backgroundColor1().cgColor)
        
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imageView.delegate = self
        
        tableView.backgroundColor = AppColors.backgroundColor2()
        tagsTxtFld.backgroundColor = AppColors.backgroundColor2()
        notesTxtView.backgroundColor = AppColors.backgroundColor2()
        
        notesTxtView.textColor = NSColor.lightGray
                
        setActionBtnTitle("Select Image")
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func saveBtnPressed(sender: AnyObject) {
        let fileTypes = ["jpg", "jpeg", "png", "tiff"]
        showOpenPanelWithFileTypes(fileTypes)
    }
    
    override func touchesBegan(with event: NSEvent) {
        
    }
    
    private func setActionBtnTitle(_ title: String) {
        actionBtn.title = title
    }

    private func showOpenPanelWithFileTypes(_ types: [String]) {
        
        let panel = NSOpenPanel()

        panel.title = "Select Image"
        panel.directoryURL = URL(fileURLWithPath: "~/Desktop", isDirectory: true)

        panel.allowsMultipleSelection = false
        panel.allowedFileTypes = types
                        
        panel.begin { (selection) in
            
            if selection == 1 {
                
                let image = self.transformedImageAtURL(panel.url)
                self.imageView.image = image
            }
        }
    }
    
    private func transformedImageAtURL(_ url: URL?) -> NSImage? {
        
        guard let _url = url else {
            return nil
        }
        
        guard let image = NSImage(contentsOf: _url) else {
            return nil
        }
        
        return transformedImage(image)
    }
    
    private func transformedImageAtPath(_ path: String?) -> NSImage? {
        
        guard let _path = path else {
            return nil
        }

        guard let image = NSImage(contentsOfFile: _path) else {
            return nil
        }
        
        return transformedImage(image)
    }
    
    private func transformedImage(_ image: NSImage) -> NSImage? {
        
        let size = image.size
        let maxSize = CGSize(width: ImageViewWidth, height: ImageViewHeight)
        let heightRatio = maxSize.height / size.height
        let widthRatio = maxSize.width / size.width
        
        let ratio = heightRatio < widthRatio ? heightRatio : widthRatio
        let finalSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        return image.resizeImage(toSize: finalSize)
    }
}

extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return colors.count
    }
}

extension ViewController: NSTableViewDelegate {
    
    fileprivate enum CellIdentifiers {
        static let NameCell = "ColorCellId"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var color: NSColor = NSColor.clear
        var cellIdentifier: String = ""
        
        //2
        if tableColumn == tableView.tableColumns[0] {
            color = colors[row]
            cellIdentifier = CellIdentifiers.NameCell
        }
        
        // 3
        if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? ColorTableCellView {
            cell.setColor(color)
            cell.setText(String(describing: color))
            return cell
        }
        
        return nil
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 35
    }
    
    func selectionShouldChange(in tableView: NSTableView) -> Bool {
        return false
    }
    
}

/*
 
extension ViewController: NSTableViewDelegate {
    
    fileprivate enum CellIdentifiers {
        static let NameCell = "NameCellID"
        static let DateCell = "DateCellID"
        static let SizeCell = "SizeCellID"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var image: NSImage?
        var text: String = ""
        var cellIdentifier: String = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        
        // 1
        guard let item = directoryItems?[row] else {
            return nil
        }
        
        // 2
        if tableColumn == tableView.tableColumns[0] {
            image = item.icon
            text = item.name
            cellIdentifier = CellIdentifiers.NameCell
        } else if tableColumn == tableView.tableColumns[1] {
            text = dateFormatter.string(from: item.date)
            cellIdentifier = CellIdentifiers.DateCell
        } else if tableColumn == tableView.tableColumns[2] {
            text = item.isFolder ? "--" : sizeFormatter.string(fromByteCount: item.size)
            cellIdentifier = CellIdentifiers.SizeCell
        }
        
        // 3
        if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            cell.imageView?.image = image ?? nil
            return cell
        }
        return nil
    }
    
}
 
*/

extension ViewController: DragAndDropImageViewDelegate {
    
    func dragAndDropImageView(imageView: DragAndDropImageView, droppedImage image: NSImage?) {
        
        if let image = image {
            
            self.imageView.image = image

            let dominantColors = image.dominantColors()
            
            var colors = [NSColor]()
            
            for i in 0..<min(dominantColors.count, 5) {
                colors.append(dominantColors[i])
            }

            self.colors = colors
            
            self.tableView.reloadData()
        }
    }
}
