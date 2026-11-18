
import Foundation

public class BankAccount {
    private var balance: Double
    public let accountHolder: String
    internal let accountNumber: Int

    public init(accountHolder: String, accountNumber: Int, initialBalance: Double) {
        self.accountHolder = accountHolder
        self.accountNumber = accountNumber
        self.balance = initialBalance >= 0 ? initialBalance : 0
    }

    public func deposit(amount: Double) {
        if amount <= 0 {
            print("Invalid deposit amount")
        } else {
            balance += amount
            print("Deposit successful: \(amount)")
        }
    }

    public func withdraw(amount: Double) {
        if amount <= 0 {
            print("Invalid withdrawal amount")
        } else if amount > balance {
            print("Insufficient balance")
        } else {
            balance -= amount
            print("Withdrawal successful: \(amount)")
        }
    }

    public func getBalance() -> Double {
        return balance
    }

    fileprivate func accountType() -> String {
        return "Savings Account"
    }
}
