require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/parking_sessions", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # ParkingSession. As you add validations to ParkingSession, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      ParkingSession.create! valid_attributes
      get parking_sessions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      parking_session = ParkingSession.create! valid_attributes
      get parking_session_url(parking_session)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_parking_session_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      parking_session = ParkingSession.create! valid_attributes
      get edit_parking_session_url(parking_session)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ParkingSession" do
        expect {
          post parking_sessions_url, params: { parking_session: valid_attributes }
        }.to change(ParkingSession, :count).by(1)
      end

      it "redirects to the created parking_session" do
        post parking_sessions_url, params: { parking_session: valid_attributes }
        expect(response).to redirect_to(parking_session_url(ParkingSession.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ParkingSession" do
        expect {
          post parking_sessions_url, params: { parking_session: invalid_attributes }
        }.to change(ParkingSession, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post parking_sessions_url, params: { parking_session: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested parking_session" do
        parking_session = ParkingSession.create! valid_attributes
        patch parking_session_url(parking_session), params: { parking_session: new_attributes }
        parking_session.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the parking_session" do
        parking_session = ParkingSession.create! valid_attributes
        patch parking_session_url(parking_session), params: { parking_session: new_attributes }
        parking_session.reload
        expect(response).to redirect_to(parking_session_url(parking_session))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        parking_session = ParkingSession.create! valid_attributes
        patch parking_session_url(parking_session), params: { parking_session: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested parking_session" do
      parking_session = ParkingSession.create! valid_attributes
      expect {
        delete parking_session_url(parking_session)
      }.to change(ParkingSession, :count).by(-1)
    end

    it "redirects to the parking_sessions list" do
      parking_session = ParkingSession.create! valid_attributes
      delete parking_session_url(parking_session)
      expect(response).to redirect_to(parking_sessions_url)
    end
  end
end
