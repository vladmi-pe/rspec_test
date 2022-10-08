module Exchange
  class Account
    include Exchange::Utils::Uid
    include Exchange::Api::Converter
    attr_reader :uid, :balance

    def initialize(user)
      @uid = hash user.name, user.surname
      @balance = 0
    end

    def transfer(receiver, amount)
      withdraw(amount)

      receiver.deposit(amount)
    end

    def transfer_with_conversion(receiver, amount, in_currency, out_currency)
      withdraw(amount)

      converted_amount = convert(sum: amount, from: in_currency, to: out_currency)

      receiver.deposit(converted_amount)
    end

    def withdraw(amount)
      raise(Exchange::NotEnoughFunds, "You try to withdraw: #{amount}, but your balance: #{@balance}") if amount > @balance
      raise(Exchange::IncorrectSum, "Amount must be positive") if amount.negative?

      @balance -= amount
    end

    def deposit(amount)
      raise(Exchange::IncorrectSum, "Amount must be positive") if amount.negative?

      @balance += amount
    end
  end
end