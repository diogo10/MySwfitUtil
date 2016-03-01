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

    //alert message
    func showMessage(let value: String){
        let alert = NSAlert.init()
        alert.messageText = value
        alert.addButtonWithTitle("Ok")
        alert.runModal()
    }



}
