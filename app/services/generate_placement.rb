# frozen_string_literal: true

class GeneratePlacement < BaseGenerator
  option :placement_id, Types::String

  def call
    yield xml_data
    return Failure(:invalid_id) unless placement

    result = Userconfiguration::Placement.new({
      id: placement[:id],
      creative: creative_seq(placement[:floor].to_f)
    })

    Success(result.encode)
  end

  private

  def placement
    placements.find { |placement| placement[:id] == placement_id }
  end
end
