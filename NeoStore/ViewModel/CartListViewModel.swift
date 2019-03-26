//
//  CartListViewModel.swift
//  NeoStore
//
//  Created by webwerks on 25/03/19.
//  Copyright © 2019 webwerks. All rights reserved.
//

import UIKit

class CartListViewModel: NSObject {
    
    var cartList = [CartModel]()
    var cartListModel: CartListModel?
    
    func getCartList(parameter:[String:Any], onSuccess: @escaping() -> Void, onFailure: @escaping(String) -> Void) {
        APIManager.sharedInstance.getData(apiName: APIConstants.listCart, parameter: parameter, onSuccess: { (data) in
            let resultDict = Utilities.getJSON(APIConstants.listCart, data)
            let statusCode = resultDict["status"] as! Int
            
            if statusCode == 200 {
                do {
                    let jsonDecoder  = JSONDecoder()
                    self.cartListModel = try jsonDecoder.decode(CartListModel.self, from: data)
                    self.cartList = self.cartListModel!.data
                    onSuccess()
                    return
                    
                } catch {
//                    onFailure(error.localizedDescription)
                    let userMessage = resultDict["user_msg"] as! String
                    onFailure(userMessage)
                }
                
            } else {
                //                let message = resultDict["message"] as! String
                let userMessage = resultDict["user_msg"] as! String
                onFailure(userMessage)
                return
            }
        }) { (error) in
            onFailure(error.localizedDescription)
            return
        }
    }
    
    func editCart(parameter:[String:Any], onSuccess: @escaping(String) -> Void, onFailure: @escaping(String) -> Void) {
        APIManager.sharedInstance.postData(apiName: APIConstants.editCart, parameter: parameter, onSuccess: { (data) in
            let resultDict = Utilities.getJSON(APIConstants.editCart, data)
            let statusCode = resultDict["status"] as! Int
            let userMessage = resultDict["user_msg"] as! String
            if statusCode == 200 {
                onSuccess(userMessage)
                return
            } else {
                //                let message = resultDict["message"] as! String
                onFailure(userMessage)
                return
            }
        }) { (error) in
            onFailure(error.localizedDescription)
            return
        }
    }
    
    func deleteCart(parameter:[String:Any], onSuccess: @escaping(String) -> Void, onFailure: @escaping(String) -> Void) {
        APIManager.sharedInstance.postData(apiName: APIConstants.deleteCart, parameter: parameter, onSuccess: { (data) in
            let resultDict = Utilities.getJSON(APIConstants.deleteCart, data)
            let statusCode = resultDict["status"] as! Int
            let userMessage = resultDict["user_msg"] as! String
            if statusCode == 200 {
                onSuccess(userMessage)
                return
            } else {
                //                let message = resultDict["message"] as! String
                onFailure(userMessage)
                return
            }
        }) { (error) in
            onFailure(error.localizedDescription)
            return
        }
    }
    
    func getCartListCount() -> Int {
        return cartList.count
    }
    
    func getProductId(index: Int) -> Int {
        return cartList[index].product_id!
    }
    
    func getProductImage(index: Int) -> String {
        return cartList[index].product.product_images!
    }
 
    func getProductName(index: Int) -> String {
        return cartList[index].product.name!
    }
    
    func getProductCategoryName(index: Int) -> String {
        return cartList[index].product.product_category!
    }
    
    func getProductCost(index: Int) -> Int {
        return cartList[index].product.cost!
    }
    
    func getProductQuantity(index: Int) -> Int {
        return cartList[index].quantity!
    }
    
    func deleteProduct(index: Int) {
        cartList.remove(at: index)
    }
    
    func editProductQuantity(index: Int, quantity: Int) {
        cartList[index].quantity = quantity
    }
}