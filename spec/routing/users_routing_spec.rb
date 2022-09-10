require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to sessions#new via GET' do
      expect(get: '/users/sign_in').to route_to('devise/sessions#new')
    end

    it 'routes to sessions#create via POST' do
      expect(post: '/users/sign_in').to route_to('devise/sessions#create')
    end

    it 'routes to sessions#destroy via DELETE' do
      expect(delete: '/users/sign_out').to route_to('devise/sessions#destroy')
    end

    it 'routes to passwords#mew via GET' do
      expect(get: '/users/password/new').to route_to('devise/passwords#new')
    end

    it 'routes to passwords#edit via GET' do
      expect(get: '/users/password/edit').to route_to('devise/passwords#edit')
    end

    it 'routes to passwords#update via PATCH' do
      expect(patch: '/users/password').to route_to('devise/passwords#update')
    end

    it 'routes to passwords#update via PUT' do
      expect(put: '/users/password').to route_to('devise/passwords#update')
    end

    it 'routes to passwords#create via POST' do
      expect(post: '/users/password').to route_to('devise/passwords#create')
    end

    it 'routes to registrations#cancel via GET' do
      expect(get: '/users/cancel').to route_to('devise/registrations#cancel')
    end

    it 'routes to registrations#new via GET' do
      expect(get: '/users/sign_up').to route_to('devise/registrations#new')
    end

    it 'routes to registrations#edit via GET' do
      expect(get: '/users/edit').to route_to('devise/registrations#edit')
    end

    it 'routes to registrations#edit via PATCH' do
      expect(patch: '/users').to route_to('devise/registrations#update')
    end

    it 'routes to registrations#edit via PUT' do
      expect(put: '/users').to route_to('devise/registrations#update')
    end

    it 'routes to registrations#destroy via DELETE' do
      expect(delete: '/users').to route_to('devise/registrations#destroy')
    end

    it 'routes to registrations#create via POST' do
      expect(post: '/users').to route_to('devise/registrations#create')
    end

    it 'routes to registrations#new via GET' do
      expect(get: '/users/confirmation/new').to route_to('devise/confirmations#new')
    end

    it 'routes to registrations#new via GET' do
      expect(get: '/users/confirmation').to route_to('devise/confirmations#show')
    end

    it 'routes to registrations#new via POST' do
      expect(post: '/users/confirmation').to route_to('devise/confirmations#create')
    end
  end
end
