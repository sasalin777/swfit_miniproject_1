//
//  main.swift
//  miniproject
//
//  Created by Li Tzu Lin on 2022-03-06.
//

import Foundation

let manager = FileManager.default
        let urlForDocument = manager.urls(for: .documentDirectory, in:.userDomainMask)
let currentDirPath: String = FileManager.default.currentDirectoryPath
        let url = urlForDocument[0] as URL
       
printFileManger(URL(fileURLWithPath: currentDirPath),indent: "")
func printFileManger(_ url: URL,indent: String) {
    let contentsOfPath = try? manager.contentsOfDirectory(at: URL(fileURLWithPath: url.path), includingPropertiesForKeys: [], options: .skipsHiddenFiles)
        
    if (contentsOfPath != nil){
    for url in contentsOfPath!{
    //print(url)
        var isDir = ObjCBool(false)
        let isExists = manager.fileExists(atPath: url.path, isDirectory: &isDir)
        let branchLine = url == contentsOfPath!.last ? "└─ ": "├─"
        let rootLine = url == contentsOfPath!.last ? "  ": " │ "
        if isExists && isDir.boolValue {
            print(indent, branchLine, manager.displayName(atPath: url.path))
            printFileManger(url, indent: indent + rootLine + "  ")
        } else {
            print(indent, branchLine, manager.displayName(atPath: url.path))
            printFileManger(url, indent: indent + "  ")
        }
    }
    } else {
        return
    }

}

