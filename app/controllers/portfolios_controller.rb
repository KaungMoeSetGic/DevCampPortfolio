class PortfoliosController < ApplicationController
    def index
        @portfolio_items = Portfolio.all
        # @portfolio_items = Portfolio.where(subtitle: "Angular")
    end

    def angular
        @portfolio_angular_items = Portfolio.angular
    end

    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end

    def create
        @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle,:body, 
            technologies_attributes: [:name]))

        respond_to do |format|
            if @portfolio_item.save
                format.html { redirect_to portfolios_url, notice: "Blog was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def edit
        @portfolio_item = Portfolio.find(params[:id])
    end

    def update
        @portfolio_item = Portfolio.find(params[:id])

        respond_to do |format|
            if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle,:body))
                format.html { redirect_to portfolios_url, notice: "The record successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def show
        @portfolio_item = Portfolio.find(params[:id])
    end

    def destroy
        @portfolio_item = Portfolio.find(params[:id])

        @portfolio_item.destroy

        respond_to do |format|
            format.html { redirect_to portfolios_url, notice: "Portfolio was successfully destroyed." }
          end
    end

end
