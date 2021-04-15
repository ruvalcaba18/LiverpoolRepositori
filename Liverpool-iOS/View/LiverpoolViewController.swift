//
//  LiverpoolViewController.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.
//

import UIKit

class LiverpoolViewController: UIViewController {
    
    var liverpoolArray:Array<recordsResposnse> = []
    var presenter: LiverpoolViewToPresenter?
    var isShimmerActive:Bool = true
    var textInTextField = ""
    var page = 1
    var vista = UIView()
    var loader = UIActivityIndicatorView()
    
    @IBOutlet weak var searchCollection: UICollectionView!{
        didSet{
            searchCollection.register(containerCell.self, forCellWithReuseIdentifier: containerCell.identifier)
        }
    }
    
    @IBOutlet weak var searchField: UITextField!{
        didSet{
            searchField.returnKeyType = .search
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpModule()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Liverpool Module"
        let mayor =  UIBarButtonItem(title: " +", style: .plain, target: self, action: #selector(addMayor))
        let menor = UIBarButtonItem(title: " -", style: .plain, target: self, action: #selector(addMenor))
        
        self.navigationItem.rightBarButtonItems = [mayor, menor]
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    func setUpModule(){
        searchField.delegate = self
        searchCollection.delegate = self
        searchCollection.dataSource = self
        self.presenter?.getSearchValues(word: "perro", Page: "\(page)")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        let alongsideHandler: ((UIViewControllerTransitionCoordinatorContext) -> Void) = {[weak self] (context)    in
            self?.searchCollection.reloadData()
         
        }
        
        let completionHandler: ((UIViewControllerTransitionCoordinatorContext) -> Void) = {[weak self] (context)    in
            self?.searchCollection.reloadData()
         
            
        }
        
        coordinator.animate(alongsideTransition: alongsideHandler, completion: completionHandler)
    }
    
    @objc func addMayor(){
      
        if textInTextField.isEmpty && page == 1{
            self.presenter?.getSearchValuesMax(word: "perro", Page: "\(page)")
        }else if !textInTextField.isEmpty && page == 1 {
            isShimmerActive = true
            liverpoolArray.removeAll()
            self.presenter?.getSearchValuesMax(word: textInTextField, Page: "\(page)")
        }else if !textInTextField.isEmpty && page != 1{
            isShimmerActive = true
            liverpoolArray.removeAll()
        self.presenter?.getSearchValuesMax(word: textInTextField, Page: "\(page)")
        }
        
    }
    @objc func addMenor(){
       
        
        if textInTextField.isEmpty && page == 1{
            self.presenter?.getSearchValuesMin(word: "perro", Page: "\(page)")
        }else if !textInTextField.isEmpty && page == 1 {
            isShimmerActive = true
            liverpoolArray.removeAll()
            self.presenter?.getSearchValuesMin(word: textInTextField, Page: "\(page)")
        }else if !textInTextField.isEmpty && page != 1{
            isShimmerActive = true
            liverpoolArray.removeAll()
        self.presenter?.getSearchValuesMin(word: textInTextField, Page: "\(page)")
        }
    }

}

extension LiverpoolViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isShimmerActive ?  10 :liverpoolArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: containerCell.identifier, for: indexPath) as? containerCell else{return UICollectionViewCell()}
        cell.shadowDecorate()
        cell.container.layer.cornerRadius  = 15
        if isShimmerActive{
            cell.addShimmerEffect()
            cell.productName.text = ""
            cell.regularPriceLabel.text = ""
            cell.discountPriceLabel.text = ""
            cell.productImage.image = nil
        }else{
            cell.arrayOfColors.append(contentsOf: liverpoolArray[indexPath.row].variantsColor ?? [])
            cell.colorsCollections.reloadData()

    let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:  "$\(liverpoolArray[indexPath.row].listPrice ?? 0)")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        cell.removeShimmerEffect()
        cell.productName.text = liverpoolArray[indexPath.row].productDisplayName ?? ""
        cell.regularPriceLabel.attributedText = attributeString
        cell.discountPriceLabel.text = "$\(liverpoolArray[indexPath.row].promoPrice ?? 0)"
        cell.productImage.cacheImage(urlString: liverpoolArray[indexPath.row].xlImage ?? "" )
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == liverpoolArray.count-1 {
            page += 1
            if textInTextField == "" {
                self.startActivityIndicator(loader: loader, vista: vista)
                self.presenter?.getSearchValues(word: "perro", Page: "\(page)")

            }else{
                self.startActivityIndicator(loader: loader, vista: vista)
                self.presenter?.getSearchValues(word: textInTextField, Page: "\(page)")
            }
        }
        
    }
   
           
}

extension LiverpoolViewController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        isShimmerActive = true
        liverpoolArray.removeAll()
        searchCollection.reloadData()
        guard let text = textField.text else {
            return true
        }
        let lastText = (text as NSString).replacingCharacters(in: range, with: string) as String
    
        textInTextField = lastText
        if textInTextField.count > 3{
            self.presenter?.getSearchValues(word: textInTextField, Page: "\(page)")

        }else  if textInTextField.count < 3{
            self.presenter?.getSearchValues(word: "perro", Page: "\(page)")
        }
        
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        isShimmerActive = true
        self.presenter?.getSearchValues(word: textInTextField, Page: "\(page)")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchField.text = ""
        return true
    }
    
}
extension LiverpoolViewController: LiverpoolPresenterToView{
    
    func setSearchValuesMin(values: [recordsResposnse]) {
        print(values)
    }
    
    func setSearchValuesMax(values: [recordsResposnse]) {
        print(values)
    }
    
    func setSearchValues(values: [recordsResposnse]) {
     
        isShimmerActive = false
      
            if liverpoolArray.isEmpty{
                liverpoolArray.append(contentsOf: values)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {[weak self] in
                  
                    self?.stopActivityIndicator(loader: self?.loader ?? UIActivityIndicatorView(), vista: self?.vista ?? UIView() )
                    self?.isShimmerActive = false
                    self?.searchCollection.reloadData()
                }
                    
                
            }else{
                liverpoolArray += values
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {[weak self] in
                    self?.stopActivityIndicator(loader: self?.loader ?? UIActivityIndicatorView(), vista: self?.vista ?? UIView() )
                    self?.isShimmerActive = false
                    self?.searchCollection.reloadData()
                }

            }

        
     
    }
    
    func onResponseError(error: String) {
        print(error)
    }
    
    
    
    
}
