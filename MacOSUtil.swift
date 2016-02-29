class MacOSUtil {


  func openPaneltoChooseAVideo(){
  
   let panel = NSOpenPanel()
        panel.allowedFileTypes = ["mp4","mov"]
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = false
        panel.canChooseFiles = true
        
        panel.beginWithCompletionHandler{ (result: Int) -> Void in if result == NSFileHandlingPanelOKButton{
             let exportedFileURL = panel.URL
            print(exportedFileURL)
            
            }
            
        }

  
  }


}
