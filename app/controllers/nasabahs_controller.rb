class NasabahsController < InternalController
  before_filter :set_nasabah, only: [:show, :edit, :update, :destroy, :approve]

  # GET /nasabahs
  # GET /nasabahs.json
  def index
    @nasabahs = Nasabah.filterize(filter_params).paginate(paginate_options) 

  end

  # GET /nasabahs/1
  # GET /nasabahs/1.json
  def show
  end

  # GET /nasabahs/new
  def new
    @nasabah = Nasabah.new
  end

  # GET /nasabahs/1/edit
  def edit
  end

  # POST /nasabahs
  # POST /nasabahs.json
  def create
    @nasabah = Nasabah.new(nasabah_params)

    respond_to do |format|
      if @nasabah.save
        format.html { redirect_to @nasabah, notice: 'Nasabah was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nasabah }
      else
        format.html { render action: 'new' }
        format.json { render json: @nasabah.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nasabahs/1
  # PATCH/PUT /nasabahs/1.json
  def update
    respond_to do |format|
      if @nasabah.update_attributes(nasabah_params)
        format.html { redirect_to @nasabah, notice: 'Nasabah was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nasabah.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nasabahs/1
  # DELETE /nasabahs/1.json
  def destroy
    @nasabah.destroy
    respond_to do |format|
      format.html { redirect_to nasabahs_url }
      format.json { head :no_content }
    end
  end

  def approve
    @nasabah.update_attribute(:approved, params[:approve].blank? ? 'yes' :  'no' ) if params[:approve].blank? or params[:approve] == 'no'
    respond_to do |format|
      format.html { redirect_to nasabahs_url }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nasabah
      @nasabah = Nasabah.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nasabah_params
      params.require(:nasabah).permit(:nama_lengkap , :tempa, :tanggal_lahir , :jenis_kelamin , :kewarganegaraan , :no_iden, :type_identitas, :expire_identitas, :no_npwp , :alamat_rumah, :alamat_surat, :no_tlp_kantor, :no_ponsel , :no_faximile , :email , :rekening_koran_gabungan , :status_pernikahan , :status_rumah_tinggal, :tanggal_rumah_tinggal, :no_tlp_rumah , :pekerjaan_utama, :pendapatan_bulanan , :bidang_usaha , :sumber_dana , :tujuan_penggunaan_dana , :tujuan_penggunaan_rekening , :nama_ibu_kandung , :agama, :product_id)
    end
end
