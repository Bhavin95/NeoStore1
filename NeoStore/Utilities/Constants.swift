//
//  Constants.swift
//  NeoStore
//
//  Created by webwerks on 18/03/19.
//  Copyright © 2019 webwerks. All rights reserved.
//

import UIKit

class APIConstants {
    
    static let statusCode = 200
    static var token = ""
    
    //MARK: User
    
    static let register = "users/register"
    static let login = "users/login"
    static let forgotPassword = "users/forgot"
    static let changePassword = "users/change"
    static let updateAccount = "users/update"
    static let fetchAccount = "users/getUserData"
    
    //MARK: Product
    
    static let productList = "products/getList"
    static let productDetails = "products/getDetail"
    static let productRating = "products/setRating"
    
    //MARK: Cart
    
    static let addToCart = "addToCart"
    static let editCart = "editCart"
    static let deleteCart = "deleteCart"
    static let listCart = "cart"
    
    //MARK: Order
    
    static let order = "order"
    static let orderList = "orderList"
    static let orderDetail = "orderDetail"
}

class Constants {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
}

class TitleConstants {
    
    static let register = "Register"
    static let home = "NeoSTORE"
    static let myCart = "My Cart"
    static let myOrders = "My Orders"
    static let placeOrder = "Place Order"
    static let myAccount = "My Account"
    static let editProfile = "Edit Profile"
    
}
