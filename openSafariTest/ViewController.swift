import UIKit

class ViewController: UIViewController {
    let urlButton = UIButton()
    let foodNameInput = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.urlButton.frame = CGRect(x: (self.view.frame.size.width - 100)/2, y: self.view.frame.size.height - 200, width: 100, height: 50)
        self.urlButton.backgroundColor = UIColor.gray
        self.urlButton.setTitle("open safari", for: .normal)
        self.urlButton.addTarget(self, action: #selector(openUrl), for: .touchUpInside)
        
        self.foodNameInput.frame = CGRect(x: (self.view.frame.size.width - 200)/2, y: 250, width: 200, height: 50)
        self.foodNameInput.placeholder = "請輸入食物名稱"
        self.foodNameInput.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(self.foodNameInput)
        self.view.addSubview(self.urlButton)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func openUrl(sender: UIButton!){
        var searchString: String?
        if let foodName = foodNameInput.text{
            searchString = foodName+"熱量"
            searchString = searchString?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        }
        let requestUrl = URL(string: "https://www.google.com.tw/search?q="+searchString!)
        UIApplication.shared.open(requestUrl!, options: [:], completionHandler: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

