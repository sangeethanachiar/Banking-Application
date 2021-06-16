//
//  ATM.swift
//  Banking App
//
//  Created by Sangeetha Nachiar on 14/06/21.
//

import Foundation
class ATM : Bank{
    
    var totalCash = 10000
  //  var car = Card()
    var ban = Bank()
    var auth = Authentication()
    
    
    func getScreen(){
        while(totalCash>0){
                print("\nWelcome To ATM Service")
            
            print("Enter Card No")
            let cardNo = Int(readLine()!)!
          //  getCardsByIndex(cardNo:cardNo)
            let index = getCardsByIndex(cardNo:cardNo)
            

            if(index != -1 ){
                print("\(ban.cards[index].cardNo)")
        if(ban.cards[index].cardStatus){
                //if(ban.cards[index + 1].cardStatus){
                              print("Enter the pin")
                             let pinNo = Int(readLine()!)!
                                 if(auth.validate(index:index,password:pinNo)){
                              print("1.Withdrawal\n2.Balance Enquiry\n3.Pin Change \n4.Mini Statement\n 5.exit")
                              print("Enter choice")
                              let choice = Int(readLine()!)
                              switch(choice){
                              case 1:
                                 withdrawal(index:index)
                              case 2:
                                 balanceEnquiry(index:index)
                              case 3 :
                                 print("..3")
                              //   pinChange(index:index)
                              case 4:
                                 print("4")
                              //   miniStatement(index:index)
                              case 5:
                                 exit(0)
                              default:
                                 print("invalid")
                              }
                         } // validate pin
                                 else{
                                     ban.cards[index].pinValidationCount += 1
                                     if(!(auth.validatePinInvalidCount(index:index))){
                                         ban.cards[index].cardStatus  = false
                                             print("Account has been blocked permanently...Due to three invalid attempts")
                                         }
                                         else{
                                             print("invalid pin.. try again")
                                         }
                                     }
                                } // card.Status
                             else{
                                 print("card has been blocked permanently")
                                 }
                             }
                         else {
                              print("Invalid card no .card doesnot exist")
                             }
                                     }
    }
    
        //}
    func validateAmount(amount:Int)->Bool{
        if(amount %  100 == 0){
            return true
        }
        return false
        
    }
    
    func validateAmountQuantity(amount :Int)->Bool{
        if (amount <= 2000){
            return true
        }
        return false
    }
        
        func withdrawal(index : Int){
        print("Enter amount in multiple of Rs 100")
         let amt = Int(readLine()!)!
            if(amt <= totalCash){
                if(validateAmount(amount: amt)){
                    if(validateAmountQuantity(amount: amt)){
                        if( amt > totalCash){
                            print("Insufficient Balance")
                        }
                        else{
                           
                            ban.cards[index].account.accBalance -= Double(amt)
                           
                            printTransactionReciept(index :index ,amt:amt)
                            totalCash = totalCash - amt
                        }
                    } // end validateAmountQuantity
                    else{
                     print("Maximum amouunt per transaction must not exceed limit of Rs.2000")
                    }
                } // end validateAmount
                else{
                    print("Please enter amount in multiples of Rs 100")
                }
            }  // amt <= cash
            else{
                print("Insufficient balance in ATM")
            }
        }
        func  balanceEnquiry(index: Int){
            printBalanceReciept(index:index)
                    } // end validatePin
                    

func printTransactionReciept(index: Int,amt:Int){
print("----------TRANSACTION RECIEPT--------")
print("Location : Chennai")
print("Amount Debted : \(amt)")
    print("Available Balance : \(ban.cards[index].account.accBalance)")
}
func printBalanceReciept(index :Int){
print("----------BALANCE ENQUIRY RECIEPT--------")
print("Location : Chennai ")
    print("Available Balance : \(ban.cards[index].account.accBalance )")
}
    
    
    }
