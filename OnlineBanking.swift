//
//  OnlineBanking.swift
//  Banking App
//
//  Created by Sangeetha Nachiar on 14/06/21.
//

import Foundation
class OnlineBanking : Bank {
   
    var atm = ATM()
    var ban = Bank()
    var  myAccount : Account  = Account(accNo: 0, accBalance: 0, transactions: [])
    var myCreditCard : Card = Card(cardNo: 0, expiryDate: 0, cvv: 0, pinNo: 0, account: Account(accNo: 0, accBalance: 0, transactions: []), cardStatus: true, pinValidationCount: 0)
    
func getChoice1(){
    print("\n1.Add Your Account\n2.Add Your Credit Cards\n3.FundTransfer\n4.Transaction History\n5.Exit")
    print("\nEnter  your choice")
    let choice = Int(readLine()!)
    switch(choice){
    case 1:
       addAccount()
        
    case 2:
       addCreditCards()
       
    case 3:
       fundTransfer()
       
    case 4:
        transactionHistory()
        
    case 5:
        exit(0)
    default:
        print("Invalid choice")
        
    }
}
func addAccount(){
    print("Enter the account Number")
    let accountNo = Int(readLine()!)!
    let ind = ban.getAccountByIndex(accountNo: accountNo)
  //  var myAcco = accounts[ind].
    print(ban.accounts.count)
    myAccount = Account(accNo:ban.accounts[ind].accNo , accBalance: ban.accounts[ind].accBalance, transactions: ban.accounts[ind].transactions)
    print("Account Added")
}
    
func addCreditCards(){
    print("Enter the card Number")
    let cardNo = Int(readLine()!)!
    var ind = ban.getCardsByIndex(cardNo: cardNo)
  // var  myCredit = ban.cards[ind]
    myCreditCard = Card(cardNo: ban.cards[ind].cardNo, expiryDate: ban.cards[ind].expiryDate, cvv: ban.cards[ind].cvv, pinNo: ban.cards[ind].pinNo, account: Account(accNo: ban.cards[ind].account.accNo, accBalance: ban.cards[ind].account.accBalance, transactions: ban.cards[ind].account.transactions), cardStatus: ban.cards[ind].cardStatus, pinValidationCount: ban.cards[ind].pinValidationCount)
    print("Card Added")
    }
   
func fundTransfer(){
  var   transArray : [Transaction] = []
    print("1.From Bank Account\n2.From Credit Cards")
    print("\nEnter your choice")
    let ch = Int(readLine()!)!
   print("Enter the Benficiary account Number")
    let accountNo = Int(readLine()!)!
    print("Enter the amount")
    var amt = Double(readLine()!)!
    print("Enter Description")
    let des = readLine()!
    let trans = Transaction(amount:amt,description : des)
   transArray.append(trans)
    var df = Payment()
    var amt1 = df.makePayment1(amount: &amt)
    
   if(ch == 1){
    if (amt1 > 500 ){
        if(amt1 < myAccount.accBalance){
        myAccount.accBalance -= amt1
        myAccount.transactions.append(trans)
       // accoBalance += amt1
         //   var benAccount = Account(accNo: accountNo, accBalance: accoBalance, transactions: transArray)
            print("Amount transfered")
        }
        else{
            print("Amount insufficient in your account")
        }
    }
    }
    
    if(ch == 2){
        
        if(amt1 < 1500 ){
        if(amt1 < myCreditCard.account.accBalance){
            myCreditCard.account.accBalance -= amt
            myCreditCard.account.transactions.append(trans)
         //   accoBalance += amt
          //var  benAccount = Account(accNo: accountNo, accBalance: accoBalance, transactions: transArray)
            print("Amount transfered")
        }
        else{
            print("Amount insufficient in your account")
        }
    }

    else {
    print("Amount insufficient")
    }
    }
}
    
func transactionHistory(){
    print("--------TRANSACTION HISTORY--------")
    for item in myAccount.transactions{
        print("Amount : \(item.amount)  Description: \(item.description!) Balance:\(myAccount.accBalance)")
    }
}
}
