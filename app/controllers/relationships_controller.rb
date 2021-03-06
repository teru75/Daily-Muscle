class RelationshipsController < ApplicationController
  before_action :authenticate_customer!
  def create
    current_customer.follow(params[:customer_id])
    @customer = Customer.find(params[:customer_id])
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    @customer = Customer.find(params[:customer_id])
  end

  def follower
    customer = Customer.find(params[:customer_id])
    @customers = customer.following_customer
  end

  def followed
    customer = Customer.find(params[:customer_id])
    @customers = customer.follower_customer
  end
end
