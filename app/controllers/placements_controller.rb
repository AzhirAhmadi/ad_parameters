# frozen_string_literal: true

class PlacementsController < ActionController::API
  def index
    render plain: GeneratePlacementSeq.call(file_path: 'dashboard_configuration_data.xml').value!
  end

  def show
    render plain: GeneratePlacement.call(file_path: 'dashboard_configuration_data.xml', placement_id: placement_id).value!
  end

  private

  def placement_id
    params[:id]
  end
end
