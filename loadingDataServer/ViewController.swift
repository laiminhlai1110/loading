
import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    var arr:[SinhVien] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let url = URL(string: "http://10.0.0.121:3000")
        var req = URLRequest(url: url!)
        req.httpMethod = "GET"
    //    let s = String(format: "HOTEN=%@&NAMSINH=%@", txt1.text!,txt2.text!)
    //    let d = s.data(using: String.Encoding.utf8)
    //    req.httpBody = d

        let task = URLSession.shared.dataTask(with: url!) { (dt:Data?, ur:URLResponse?, e:Error?) in
            
            DispatchQueue.main.async {
                
                
                do{
                    let json = try JSONDecoder.init().decode(DULIEU.self, from: dt!)
                    self.arr = json.sv
                    self.tableView.reloadData()
                    
                    
                }catch{
                    print("errors")
                }
            
            }
            
        }
        task.resume()
        
        
    }
        
        
        
     
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! svTableViewCell
        cell.HOTEN.text = arr[indexPath.row].HOTEN
        cell.NAMSINH.text = String(arr[indexPath.row].NAMSINH)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }


}

struct  DULIEU:Codable {
    var sv:[SinhVien]
}
struct SinhVien:Codable {
    var HOTEN:String
    var  NAMSINH:Int
    
}
