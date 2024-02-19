# frozen_string_literal: true

class GeneratePlacementSeq < BaseGenerator
  def call
    yield xml_data

    Success(placement_seq.encode)
  end

  private

  def placement_seq
    result = Userconfiguration::PlacementSeq.new

    placements.map do |placement|
      result.placement << Userconfiguration::Placement.new({
        id: placement[:id],
        creative: creative_seq(placement[:floor].to_f)
      })
    end

    result
  end
end
