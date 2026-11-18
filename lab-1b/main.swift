import Foundation

let account = BankAccount(
    accountHolder: "Yash",
    accountNumber: 101,
    initialBalance: 5000
)

print("Account Holder:", account.accountHolder)
print("Account Number:", account.accountNumber)
print("Initial Balance:", account.getBalance())

account.deposit(amount: 2000)
account.withdraw(amount: 1000)
account.withdraw(amount: 10000)
account.deposit(amount: -500)

print("Final Balance:", account.getBalance())
