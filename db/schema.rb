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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130507093241) do

  create_table "nasabahs", force: true do |t|
    t.string   "nama_lengkap"
    t.string   "tempat_lahir"
    t.date     "tanggal_lahir"
    t.string   "jenis_kelamin"
    t.string   "kewarganegaraan"
    t.string   "no_identitas"
    t.string   "type_identitas"
    t.date     "expire_identitas"
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
    t.date     "tanggal_rumah_tinggal"
    t.string   "no_tlp_rumah"
    t.string   "pekerjaan_utama"
    t.string   "pendapatan_bulanan"
    t.string   "bidang_usaha"
    t.string   "sumber_dana"
    t.string   "tujuan_penggunaan_dana"
    t.string   "tujuan_penggunaan_rekening"
    t.string   "nama_ibu_kandung"
    t.string   "agama"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "first_credit"
    t.integer  "month_credit"
    t.text     "description"
    t.integer  "months_period"
    t.integer  "version"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "nasabah_id"
    t.integer  "debit"
    t.integer  "credit"
    t.string   "description"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
