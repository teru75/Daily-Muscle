class DatasController < ApplicationController
  before_action :authenticate_customer!
  def index
    @customer = Customer.find(params[:customer_id])
    if @customer.is_data_available == false && @customer != current_customer
      flash[:alert] = "このアカウントのデータは許可されていません。"
      redirect_to customer_path(@customer)
    end
    @dayline = []
    @timeline = []
    count = 0
    if params[:name].blank?
    @events = @customer.events.joins(:menus).order(start: "ASC").last(5)
    else
    @events = @customer.events.joins(:menus).where(menus:{name: params[:name]}).order(start: "ASC").last(5)
    end
    @events.each do |event|
      event.menus.each do |menu|
        if menu.name == params[:name] && count < 5
          count += 1
          @dayline.push(menu.event.start.strftime('%m月%d日').to_s)
          @timeline.push(menu.reps.order(weight: "DESC").first[:weight])
        end
      end
    end
  end
end
