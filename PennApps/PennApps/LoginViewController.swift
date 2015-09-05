//
//  LoginViewController.swift
//  PennApps
//
//  Created by Darpan Shah on 9/4/15.
//  Copyright © 2015 Darpan Shah. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class LoginViewController {
    
    func loginUserWithEmailAndPassword(email: String, password: String, remember: Bool, completionHandler : ((isResponse : Bool) -> Void)) {
        
        
        //        var r = Alamofire.request(.POST, "http://10.101.120.56/oauth/token", parameters: [
        //            "email": email,
        //            "password": password
        //            ]
        //            ).responseJSON() {
        //                (request, response, data, err) in
        
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForResource = 4 // seconds
        
        self.alamofireManager = Alamofire.Manager(configuration: configuration)
        self.alamofireManager!.request(.POST, "http://10.101.120.56/oauth/token", parameters: [
            "email": email,
            "password": password
            ]).responseJSON() { (request, response, data, error) in
                
                
                println("Request \(request)")
                println("Response \(response)")
                println("Data \(data)")
                println("Error \(error?.description)")
                
                
                
                if data == nil   {
                    self.errors = "SERVER ERROR"
                    completionHandler(isResponse : false)
                }else{
                    let json = JSON(data!)
                    println(json)
                    if json["non_field_errors"][0] == "Unable to login with provided credentials." {
                        self.errors = "INVALID CREDENTIALS"
                        completionHandler(isResponse : false)
                        
                    }else if json["token"] != nil{ // ensure token is recieved
                        var token = json["token"]
                        var userToken = "\(token)"
                 //Code for when Keep me logged in checked
                       /* if remember{
                            // Uses KWrapper to save token to keychain
                            //
                            KeychainWrapper.setString(userToken, forKey: "token")
                            KeychainWrapper.setString(userToken, forKey: "local-token")
                        } else {
                            KeychainWrapper.setString(userToken, forKey: "local-token")
                        } */
                        
                        // Register the device ID
                        //
                        let uuid: String? = UIDevice.currentDevice().identifierForVendor.UUIDString
                        self.addDeviceId(userToken, uuid: uuid!)
                        
                        var t:() = self.authorizeUserWithToken(userToken, completionHandler: { (isResponse) -> Void in
                            if isResponse{
                                completionHandler(isResponse : true)
                            } else {
                                completionHandler(isResponse: false)
                                self.errors = "INVALID USER"
                            }
                        })
                        
                        
                    } else {
                        self.errors = "INVALID REQUEST"
                        completionHandler(isResponse : false)
                    }
                    
                }
        }
        
    }// end request
    
    
    
    // Register method that sends request to server with user information
    //
    func regiserUser(firstName: String, lastName: String, email: String, password: String, birthDate: String, height: Float, gender: String, completionHandler : ((isResponse : Bool) -> Void)){
        println()
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForResource = 4 // seconds
        
        self.alamofireManager = Alamofire.Manager(configuration: configuration)
        self.alamofireManager!.request(.POST, "URL of the server goes here", parameters: [
            "email":email,
            "password": password,
            "first_name" : firstName,
            "last_name" : lastName,
            "gender" : gender,
            ]).responseJSON() { (request, response, data, error) in
                
                println(error)
                println(response)
                println(data)
                
                if data == nil {
                    completionHandler(isResponse: false)
                    self.errors = "Server ERROR"
                    User().alert("Server Error", message: "Server missing")
                    
                }else{
                    var json = JSON(data!)
                    println("json and data \(data!)")
                    // convert JSON key into string
                    var e = json["email"]
                    var serverEmail = "\(e)"
                    var serverReply = json["email"][0]
                    println(serverEmail)
                    // Ensure the response email mathches the input and log the user in
                    //
                    if serverEmail == email{
                        var successfulLogin: () = self.loginUserWithEmailAndPassword(email, password: password, remember: false, completionHandler: { (isResponse) -> Void in
                            
                            if isResponse{
                                completionHandler(isResponse: true)
                            } else {
                                completionHandler(isResponse: false)
                            }
                            
                        })
                    }else if serverReply == "This field must be unique."{
                        
                        User().alert("Existing User", message: "User Exists already!")
                    }
                    else if serverReply == "Enter a valid email address."{
                        User().alert("Invalid Email", message: "Enter a valid email address.")
                    }
                    else{
                        println("Nothing I can do")
                    }
                }
                
        } // end of response
    } // end of register
    
    
}