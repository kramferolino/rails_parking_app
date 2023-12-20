require 'rails_helper'

RSpec.describe ParkingSpacesController, type: :controller do
  describe '#update_slots' do
    let(:parking_space) { create(:parking_space) }

    it 'correctly updates parking slots' do
      new_slot_count = parking_space.parking_slots_count + 5 # Adjust this count as needed

      put :update_slots, params: { id: parking_space.id, parking_space: { number_of_slots: new_slot_count } }

      parking_space.reload
      expect(parking_space.parking_slots.count).to eq(new_slot_count)
    end

    it 'renders edit_slots template when update fails' do
      # Create a scenario where the update fails (e.g., invalid parameters)
      put :update_slots, params: { id: parking_space.id, parking_space: { number_of_slots: 'invalid' } }

      expect(response).to render_template(:edit_slots)
    end

    it 'redirects to parking space after successful update' do
      new_slot_count = parking_space.parking_slots_count + 3 # Adjust this count as needed

      put :update_slots, params: { id: parking_space.id, parking_space: { number_of_slots: new_slot_count } }

      expect(response).to redirect_to(parking_space)
      expect(flash[:notice]).to eq('Parking slots updated successfully')
    end
  end
end
