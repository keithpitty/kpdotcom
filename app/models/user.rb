# coding: utf-8

class User < ApplicationRecord
  acts_as_authentic do |c|
    c.crypto_provider = ::Authlogic::CryptoProviders::SCrypt
  end

  validates :login, uniqueness: { case_sensitive: false }
end
