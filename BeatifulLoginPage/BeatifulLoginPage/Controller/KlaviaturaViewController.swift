//
//  KlaviaturaViewController.swift
//  BeatifulLoginPage
//
//  Created by Bobomurod Ergashev on 08/08/22.
//

import UIKit

class KlaviaturaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    private var textfield : UITextField!
    private var flag = false
    private var deletebtn : UIButton!
    private var symbolsandnumbersarray = [String]()
    static var tabview: UITableView!
    static var klaviaturaarray = [Mcontact]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Keyboard"
        view.backgroundColor = .white
        self.initviews()
    }
 
    func initviews(){
        let vieww = UIView(frame: CGRect(x: 70, y: 270, width: windowWidth-140, height: 40))
        vieww.backgroundColor = .white
        vieww.layer.shadowColor = UIColor(red: 100/255, green: 100/255, blue: 200/255, alpha: 1.0).cgColor
        vieww.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
        vieww.layer.shadowRadius = 10
        vieww.layer.shadowOpacity = 0.9
        vieww.layer.cornerRadius = 20
        view.addSubview(vieww)
        
        textfield = UITextField(frame: CGRect(x: 40, y: 0, width: vieww.frame.width-80, height: vieww.frame.height))
        textfield.textColor = .black
        textfield.font = .systemFont(ofSize: 20)
        textfield.textAlignment = .center
        textfield.backgroundColor = .white
        textfield.isUserInteractionEnabled = true

        textfield.addTarget(self, action: #selector(onTextField(_:)), for: .editingChanged)

        vieww.addSubview(textfield)

        deletebtn = UIButton(frame: CGRect(x: vieww.frame.maxX - 110, y: textfield.frame.minY + 7, width: 24, height: 24))
        deletebtn.setImage(UIImage(named: "del"), for: .normal)
        deletebtn.backgroundColor = .white
        deletebtn.isHidden = false
        deletebtn.addTarget(self, action: #selector(onDeletebtn(_:)), for: .touchUpInside)
        vieww.addSubview(deletebtn)

        self.initbtns()
        
        
        
        KlaviaturaViewController.tabview = UITableView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: vieww.frame.minY ))
                KlaviaturaViewController.tabview.delegate = self
                KlaviaturaViewController.tabview.dataSource = self
                view.addSubview(KlaviaturaViewController.tabview)
        
        
     
    }
    
    func initbtns(){
        let baseview = UIView(frame: CGRect(x: 50, y: windowHeight / 3 + 50, width: windowWidth - 100, height: 2*windowHeight / 3 - 120))
        baseview.backgroundColor = .clear
        view.addSubview(baseview)
        let spacing: CGFloat = 22
        let top:CGFloat = 17
        let buttonWidth: CGFloat = (baseview.frame.width - 4*spacing)/3
        var count = -1

        for i in 0 ... 3{
            for j in 0 ... 2{
                count += 1
                if count <= 8{
                    let btn = UIButton(frame: CGRect(x: CGFloat(j+1) * spacing + CGFloat(j)*buttonWidth, y: CGFloat(i+1) * top + CGFloat(i)*buttonWidth, width: buttonWidth, height: buttonWidth ))
                    btn.backgroundColor = UIColor(red: 10/255, green: 10/255, blue: 19/255, alpha: 1.0)
                    btn.tag = count
                    btn.setTitle("\(btn.tag + 1 )", for: .normal)
                    btn.setTitleColor(.yellow, for: .normal)
                    btn.layer.cornerRadius = buttonWidth/2
                    btn.layer.shadowColor = UIColor(red: 100/255, green: 100/255, blue: 200/255, alpha: 1.0).cgColor
                    btn.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
                    btn.layer.shadowRadius = 10
                    btn.layer.shadowOpacity = 0.9
                    btn.titleLabel?.font = .systemFont(ofSize: 20)
                    btn.addTarget(self, action: #selector(onBtnPressed(_:)), for: .touchUpInside)
                    print(btn.tag)

                    baseview.addSubview(btn)
                }else{
                    if count == 10{
                        let btn = UIButton(frame: CGRect(x: CGFloat(j+1) * spacing + CGFloat(j)*buttonWidth, y: CGFloat(i+1) * top + CGFloat(i)*buttonWidth, width: buttonWidth, height: buttonWidth ))
                        btn.backgroundColor = UIColor(red: 10/255, green: 10/255, blue: 19/255, alpha: 1.0)
                        btn.tag = count
                        btn.titleLabel?.font = .systemFont(ofSize: 30)
                        btn.layer.shadowColor = UIColor(red: 100/255, green: 100/255, blue: 200/255, alpha: 1.0).cgColor
                        btn.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
                        btn.layer.shadowRadius = 10
                        btn.layer.shadowOpacity = 0.9
                        btn.setTitle( btn.tag == 9 ? "*" : btn.tag == 10 ? "0" : btn.tag == 11 ? "#" : "-" , for: .normal)
                        btn.setTitleColor(.yellow, for: .normal)
                        btn.layer.cornerRadius = buttonWidth/2
                        btn.isUserInteractionEnabled = true
                        btn.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(onPressedGestureBtn(_:))))
                        
                    btn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onPressedTapGestureBtn(_:))))
//                        print(btn.tag)

                        baseview.addSubview(btn)
                    }else{
                        let btn = UIButton(frame: CGRect(x: CGFloat(j+1) * spacing + CGFloat(j)*buttonWidth, y: CGFloat(i+1) * top + CGFloat(i)*buttonWidth, width: buttonWidth, height: buttonWidth ))
                        btn.backgroundColor = UIColor(red: 10/255, green: 10/255, blue: 19/255, alpha: 1.0)
                        btn.tag = count
                        btn.titleLabel?.font = .systemFont(ofSize: 30)

                        btn.setTitle( btn.tag == 9 ? "*" : btn.tag == 10 ? "0" : btn.tag == 11 ? "#" : "-" , for: .normal)
                        btn.setTitleColor(.yellow, for: .normal)
                        btn.layer.cornerRadius = buttonWidth/2
                        btn.layer.shadowColor = UIColor(red: 100/255, green: 100/255, blue: 200/255, alpha: 1.0).cgColor
                        btn.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
                        btn.layer.shadowRadius = 10
                        btn.layer.shadowOpacity = 0.9
                        btn.addTarget(self, action: #selector(onBtnPressed(_:)), for: .touchUpInside)
                        print(btn.tag)

                        baseview.addSubview(btn)
                    }
                       
                    
                  
                }
                
                if i*j == 6{
                    count = 12
                    let btn = UIButton(frame: CGRect(x: 2 * spacing + buttonWidth, y: 5 * top + 4*buttonWidth, width: buttonWidth, height: buttonWidth ))
    //                rgb(16, 15, 15)
                    btn.backgroundColor = .btnColor
                    btn.setImage(UIImage(named: "called"), for: .normal)
                    
                    btn.setTitleColor(.white, for: .normal)
                    btn.layer.cornerRadius = buttonWidth/2
                    btn.tag = count
                    btn.addTarget(self, action: #selector(onBtnPressed(_:)), for: .touchUpInside)
                    print("ooo")
                    baseview.addSubview(btn)
                }
            }
          
        }
    }
    
    @objc func onBtnPressed(_ sender: UIButton){
        if sender.tag == 9 || sender.tag == 10 || sender.tag == 11{
            textfield.text =  sender.tag == 9 ? (textfield.text ?? "") + "*" : sender.tag == 10 ?  (textfield.text ?? "") + "\(0)" : sender.tag == 11 ? (textfield.text ?? "") + "#" : ""
            self.symbolsandnumbersarray.append(textfield.text ?? "")

        }else if sender.tag == 12{
            return
        }else{
            textfield.text = (textfield.text ?? "") + "\(sender.tag+1)"
            self.symbolsandnumbersarray.append(textfield.text ?? "")
            if symbolsandnumbersarray.count > 0{
                            KlaviaturaViewController.tabview.isHidden = false

                            for i in symbolsandnumbersarray.count-1 ..< symbolsandnumbersarray.count{
                                var text = self.symbolsandnumbersarray[i]
                                print(symbolsandnumbersarray)
                                KlaviaturaViewController.klaviaturaarray = ContactsViewController.arr.search(key: text)
                                KlaviaturaViewController.tabview.reloadData()
                            }
                        }

        }
        
    }
    
    @objc func onTextField(_ textField: UITextField){
        var text = textField.text ?? ""
        ContactsViewController.arr
    }
    
    @objc func onPressedGestureBtn(_ btn: UIButton){
        
        if symbolsandnumbersarray.count == 0 || symbolsandnumbersarray[symbolsandnumbersarray.count-1] != "+"{
            textfield.text = (textfield.text ?? "") + "+"
            self.symbolsandnumbersarray.append(textfield.text ?? "")
        }
        
       
    }
    @objc func onPressedTapGestureBtn(_ btn: UIButton){
      
        textfield.text = (textfield.text ?? "") + "0"
        self.symbolsandnumbersarray.append(textfield.text ?? "")

        
    }
    
    @objc func onDeletebtn(_ sender: UIButton){
        if !((self.textfield.text!.isEmpty)){
                    self.textfield.text?.removeLast()
                    self.symbolsandnumbersarray.removeLast()
                    if symbolsandnumbersarray.count > 0{
                        for i in symbolsandnumbersarray.count-1 ..< symbolsandnumbersarray.count{
                            var text = self.symbolsandnumbersarray[i]
                            print(symbolsandnumbersarray)
                            KlaviaturaViewController.klaviaturaarray = ContactsViewController.arr.search(key: text)
                            KlaviaturaViewController.tabview.reloadData()
                        }
                    }else{
                        KlaviaturaViewController.tabview.isHidden = true
                    }
                 
        //            print(symbolsandnumbersarray)
                }else{
                    return
                }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return KlaviaturaViewController.klaviaturaarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UITableViewCell")
                cell.textLabel?.text = KlaviaturaViewController.klaviaturaarray[indexPath.row].name
                cell.detailTextLabel?.text = KlaviaturaViewController.klaviaturaarray[indexPath.row].phone
                return cell
    }
    
}
