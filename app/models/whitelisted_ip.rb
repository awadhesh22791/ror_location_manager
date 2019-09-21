require 'resolv'

class WhitelistedIp < ApplicationRecord
    validates :ip, :presence => true, uniqueness: {case_sensitive:false,scope: :deleted_at}, :format => { :with => Resolv::IPv4::Regex }
end