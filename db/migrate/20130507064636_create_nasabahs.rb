class CreateNasabahs < ActiveRecord::Migration
  def change
    create_table :nasabahs do |t|

      t.string :nama_lengkap
      t.string :tempat_lahir
      t.date :tanggal_lahir
      t.string :jenis_kelamin
      t.string :kewarganegaraan
      t.string :no_identitas
      t.string :type_identitas
      t.date :expire_identitas
      t.string :no_npwp
      t.text :alamat_rumah
      t.text :alamat_surat
      t.string :no_tlp_kantor
      t.string :no_ponsel
      t.string :no_faximile
      t.string :email
      t.boolean :rekening_koran_gabungan
      t.string :status_pernikahan
      t.string :status_rumah_tinggal
      t.date :tanggal_rumah_tinggal
      t.string :no_tlp_rumah
      t.string :pekerjaan_utama
      t.string :pendapatan_bulanan
      t.string :bidang_usaha
      t.string :sumber_dana
      t.string :tujuan_penggunaan_dana
      t.string :tujuan_penggunaan_rekening
      t.string :nama_ibu_kandung
      t.string :agama

      t.timestamps
    end
  end
end
