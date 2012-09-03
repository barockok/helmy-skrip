class Nasabah < ActiveRecord::Base
  attr_accessible :agama, :alamat_rumah, :alamat_surat, :bidang_usaha, :email, :expire_identitas, :jenis_kelamin, :kewarganegaraan, :nama_ibu_kandung, :nama_lengkap, :no_faximile, :no_identitas, :no_npwp, :no_ponsel, :no_tlp_kantor, :no_tlp_rumah, :pekerjaan_utama, :pendapatan_bulanan, :rekening_koran_gabungan, :setoran_awal, :status_pernikahan, :status_rumah_tinggal, :sumber_dana, :tanggal_lahir, :tanggal_rumah_tinggal, :tempat_lahir, :tujuan_penggunaan_dana, :tujuan_penggunaan_rekening, :type_identitas
end
