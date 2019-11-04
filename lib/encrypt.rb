require_relative "encryption_help_module"
class Encrypt
  include EncryptionHelpModule
  attr_reader :encryption_key, :message, :alphabet, :key_letter
  def initialize(encryption_key, message)
    @encryption_key = encryption_key
    @message = message
    @key_letter = [:a, :b, :c, :d]
  end
end
