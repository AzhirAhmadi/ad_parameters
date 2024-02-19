# frozen_string_literal: true

require 'extensions/string'
require 'userconfiguration'

class BaseGenerator < ApplicationService
  option :file_path, Types::String

  protected

  def xml_data
    return @xml_data if defined?(@xml_data)

    data = Rails.root.join(*file_path).existence&.read

    return Failure(:invalid_file) unless data

    @xml_data = Success(Hash.from_xml(data))
  rescue REXML::ParseException
    Failure(:invalid_xml)
  end

  def placements
    @_placement ||= xml_data.value!['Data']['Placements']['Placement'].map(&:symbolize_keys)
  end

  def creatives_with_euro_price
    return @_creatives_with_euro_price if defined?(@_creatives_with_euro_price)

    creatives = xml_data.value!['Data']['Creatives']['Creative'].map(&:symbolize_keys)

    @_creatives_with_euro_price = creatives.map do |creative|
      {
        id: creative[:id],
        price: creative[:price].to_euro_from(creative[:currency])
      }
    end
  end

  def creatives_filtered_by_floor_price(floor)
    creatives_with_euro_price.select do |creative|
      creative[:price] >= floor
    end
  end

  def creative_seq(floor_price)
    result = Userconfiguration::CreativeSeq.new

    creatives_filtered_by_floor_price(floor_price).each do |creative|
      result.creative << Userconfiguration::Creative.new(creative)
    end
  end
end
