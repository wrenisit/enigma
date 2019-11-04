require_relative 'encryption_help_module'
class Decrypt
  include EncryptionHelpModule
  attr_reader :decryption_key, :message
  def initialize(decryption_key, message)
    @decryption_key = decryption_key
    @message = message
  end
end
