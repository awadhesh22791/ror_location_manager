require 'resolv'

class WhitelistedIp < ApplicationRecord
    validates :ip, :presence => true, :format => { :with => Resolv::IPv4::Regex }
end