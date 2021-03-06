# This is how you define your own custom exception classes
require_relative'transaction'

class DepositError < StandardError
end

class BankAccount
attr_reader :name,:position
  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the position variable)

  MIN_DEPOSIT =  100

  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    add_transaction(-amount)
    " Your withdraw is: #{amount} /n Your current position is: #{@position}"
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    add_transaction(amount)
    " Your deposit is: #{amount} /n Your current position is: #{@position}"
  end

  def transactions_history(args = {})
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array !
    if args[:password] == @password
      #@transactions.map{|transaction| transaction.to_s}.join("\n")
      @transactions.map(&:to_s).join("\n") #=> Amelioration
    elsif args.empty?
      'no password given'
    else
      'wrong password'
    end
  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it

    @iban[0..3] + "*"*(@iban.size-7) + @iban[-3..-1]
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: Displays the account owner, the hidden iban and the position of the account

    "Account Owner: #{@name} /n IBAN:#{iban} /n Position: #{@position}"
  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    # TODO: update the current position (which represents the balance of the account)
    @transactions << Transaction.new(amount)
    @position += amount

  end

end
