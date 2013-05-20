class ProductsController < InternalController
  before_filter :set_master_product, :only => [:upgrade, :do_upgrade]
  before_filter :set_product, only: [:show, :edit, :update, :destroy]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def upgrade
    @product = Product.new(@master_product.clone_attr_for_upgrade)
  end

  def do_upgrade
    @product = Product.new(@master_product.clone_attr_for_upgrade.merge(product_params))
    if @product.save
      redirect_to @product, notice: 'Product was successfully upgraded.'
    else  
      flash[:alert] = @product.errors.to_a.join(', ')
      render :action => :upgrade
    end
  end
  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    flash[:alert] = @product.errors.to_a.join(', ') unless @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    def set_master_product
      set_product
      @master_product = @product
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :first_credit, :month_credit, :description, :months_period, :version, :code)
    end
end
