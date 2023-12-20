require 'rails_helper'

RSpec.describe EntrancesController, type: :controller do
  describe '#create' do
    let(:valid_entrance_params) { { name: 'Entrance Name', location: 'Location', parking_space_id: create(:parking_space).id } }
    let(:invalid_entrance_params) { { name: '', location: '', parking_space_id: nil } }

    it 'creates an entrance with valid parameters' do
      post :create, params: { entrance: valid_entrance_params }

      expect(response).to redirect_to(assigns(:entrance).parking_space)
      expect(flash[:notice]).to eq('Entrance added successfully')
    end

    it 'fails to create an entrance with invalid parameters' do
      post :create, params: { entrance: invalid_entrance_params }

      expect(response).to render_template(:new)
      expect(flash.now[:alert]).to eq('Failed to create entrance. Please check the provided information.')
    end
  end
end
