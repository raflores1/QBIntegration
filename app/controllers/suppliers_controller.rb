class SuppliersController < ApplicationController
  before_action :set_supplier,  only: [:show, :edit, :update, :destroy]
  # before_action :set_qbo, only: [:edit, :update, :destroy, :create]

  # GET /suppliers
  # GET /suppliers.json
  def index
    # reset_session
    @suppliers = Supplier.all
    @auth_data = oauth_data
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)
    qbo = QboApi.new(oauth_data)
    vendor = {  "PrimaryPhone": {
                                "FreeFormNumber": supplier_params[:phone]
                              },
              "PrimaryEmailAddr": 
                                {
                                "Address": supplier_params[:email]
                                },
              "WebAddr":        { 
                                "URI": supplier_params[:website]
                              },
                "DisplayName": supplier_params[:name],
                "CompanyName": supplier_params[:name]
    }
    response = qbo.create(:vendor, payload: vendor)
    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'Supplier was successfully created.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'Supplier was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def oauth_data
  {
    consumer_key: CONSUMER_KEY,
    consumer_secret: CONSUMER_SECRET,
    token: session[:token],
    token_secret: session[:secret],
    realm_id: session[:realm_id]
  }
end

# def set_qbo
  
# end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name, :email, :phone, :website)
    end
end
