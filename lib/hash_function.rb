require 'digest'

class HashFunction
  def self.hash(input)
    Digest::MD5.hexdigest(input)
  end
end
