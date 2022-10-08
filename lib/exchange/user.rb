# frozen_string_literal: true

module Exchange
  class User
    extend Forwardable
    attr_reader :name, :surname, :account

    def_delegators :account, :balance

    def initialize(name, surname)
      @name = name
      @surname = surname
      create_account
    end

    private

    def create_account
      @account = Account.new(self)
    end
  end
end
