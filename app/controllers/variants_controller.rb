class VariantsController < ApplicationController
  def index
    @variants = Variant.where(:product_id => params[:product_id])
  end

  def new
    @variant = Variant.new
  end

  def create
    @product = Product.find params[:product_id]
    @variant = Variant.new params[:variant]
    @product.variants << @variant

    if @variant.valid?
      @variant.save
      return redirect_to product_variants_path(params[:product_id]), notice: "Your product with variant #{@variant.name} has been created!"
    end

    render :new
  end

  def update
    @variant = Variant.find_by_id params[:id]

    if @variant.update_attributes params[:variant]
      return redirect_to product_variants_path(params[:product_id]), notice: "Your variant #{@variant.name} has been updated!"
    end

    render :edit
  end

  def show #action to show with delete
    @product = Product.find_by_id(params[:product_id])
    @product.variants.find(params[:id]).destroy
    return redirect_to product_variants_path(params[:product_id])
  end

  def edit
    @variant = Variant.find_by_id params[:id]
  end


end
