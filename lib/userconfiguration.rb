# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'

module Userconfiguration
  ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

  ##
  # Message Classes
  #
  class Creative < ::Protobuf::Message; end
  class CreativeSeq < ::Protobuf::Message; end
  class Placement < ::Protobuf::Message; end
  class PlacementSeq < ::Protobuf::Message; end


  ##
  # Message Fields
  #
  class Creative
    optional :string, :id, 1
    optional :float, :price, 2
  end

  class CreativeSeq
    repeated ::Userconfiguration::Creative, :creative, 1
  end

  class Placement
    optional :string, :id, 1
    repeated ::Userconfiguration::Creative, :creative, 2
  end

  class PlacementSeq
    repeated ::Userconfiguration::Placement, :placement, 1
  end

end

