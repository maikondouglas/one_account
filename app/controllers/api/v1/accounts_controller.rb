# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      before_action :set_account, only: [:show, :update, :destroy]

      def index
        accounts = account_repo.all

        render json: accounts
      end

      def show
        render json: @account
      end

      def create
        account = AccountService::Creator.create(account_params)

        render json: account, serializer: Api::V1::AccountResourceSerializer
      end

      def update
        if @account.update(account_params)
          render json: { success: true, message: 'Account was successfully updated', data: @account }, status: :ok
        else
          render json: @account.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @account.destroy

        head :no_content
      end

      private

        def account_params
          params.require(:account).permit(:first_name, :last_name, :email, :phone_number, :birthday)
        end

        def set_account
          @account = account_repo.find(params[:id])
        end

        def account_repo
          @account_repo ||= Accounts::Repository.new
        end
    end
  end
end
