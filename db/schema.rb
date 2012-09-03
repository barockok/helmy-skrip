# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120903213038) do

  create_table "nasabah_statuses", :force => true do |t|
    t.integer  "nasabah_id"
    t.string   "status"
    t.text     "keterangan"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "actor_id"
  end

  create_table "nasabahs", :force => true do |t|
    t.string   "nama_lengkap"
    t.string   "tempat_lahir"
    t.datetime "tanggal_lahir"
    t.string   "jenis_kelamin"
    t.string   "kewarganegaraan"
    t.string   "no_identitas"
    t.string   "type_identitas"
    t.datetime "expire_identitas"
    t.string   "no_npwp"
    t.text     "alamat_rumah"
    t.text     "alamat_surat"
    t.string   "no_tlp_kantor"
    t.string   "no_ponsel"
    t.string   "no_faximile"
    t.string   "email"
    t.boolean  "rekening_koran_gabungan"
    t.string   "status_pernikahan"
    t.string   "status_rumah_tinggal"
    t.datetime "tanggal_rumah_tinggal"
    t.string   "no_tlp_rumah"
    t.string   "pekerjaan_utama"
    t.string   "pendapatan_bulanan"
    t.string   "bidang_usaha"
    t.string   "sumber_dana"
    t.string   "tujuan_penggunaan_dana"
    t.string   "tujuan_penggunaan_rekening"
    t.integer  "setoran_awal"
    t.string   "nama_ibu_kandung"
    t.string   "agama"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "setorans", :force => true do |t|
    t.integer  "nasabah_id"
    t.integer  "actor_id"
    t.integer  "amount"
    t.integer  "term"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nama_lengkap"
    t.string   "role_type"
    t.string   "username"
    t.string   "password"
    t.string   "jabatan"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
