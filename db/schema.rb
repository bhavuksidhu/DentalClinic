# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_10_103608) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "postal_code"
    t.string "region"
    t.text "address"
    t.string "municipalities"
    t.string "building_name"
    t.string "floors"
    t.string "fax_number"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_clinics_on_user_id"
  end

  create_table "counselings", force: :cascade do |t|
    t.string "resp_dr"
    t.string "resp_couns_staff"
    t.string "first_visit"
    t.string "re_first_visit"
    t.string "second_visit"
    t.string "p_consult"
    t.string "inspection"
    t.string "treat_plan"
    t.string "prostho"
    t.string "denture"
    t.string "whitening"
    t.string "implant"
    t.string "invisalign"
    t.string "other_correc"
    t.string "micro"
    t.string "maintainance"
    t.string "main_resv_date"
    t.string "main_trans"
    t.string "type_agree"
    t.string "prostho_type"
    t.string "no_of_implant"
    t.string "site"
    t.string "offer_amt"
    t.string "agreement"
    t.string "cons_sign_date"
    t.string "contract_amt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "course_imp_date"
    t.date "pcourse_imp_date"
    t.bigint "patient_id", null: false
    t.index ["patient_id"], name: "index_counselings_on_patient_id"
  end

  create_table "dentist_hygienists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dentists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oral_types", force: :cascade do |t|
    t.string "name"
    t.bigint "counseling_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "exp_date"
    t.date "imp_date"
    t.index ["counseling_id"], name: "index_oral_types_on_counseling_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "appointment", default: [], array: true
    t.integer "patient_number"
    t.string "patient_visit_route"
    t.string "keyword"
    t.boolean "panorama"
    t.boolean "caries_check"
    t.string "course"
    t.string "p_course"
    t.text "note"
    t.bigint "dentist_id", null: false
    t.bigint "dentist_hygienist_id", null: false
    t.bigint "treatment_coordinator_id", null: false
    t.bigint "clinic_id", null: false
    t.date "last_visit_date"
    t.index ["clinic_id"], name: "index_patients_on_clinic_id"
    t.index ["dentist_hygienist_id"], name: "index_patients_on_dentist_hygienist_id"
    t.index ["dentist_id"], name: "index_patients_on_dentist_id"
    t.index ["treatment_coordinator_id"], name: "index_patients_on_treatment_coordinator_id"
  end

  create_table "staff_infos", force: :cascade do |t|
    t.string "staff_code"
    t.string "first_name"
    t.string "last_name"
    t.string "sex"
    t.string "job_type"
    t.string "occupation"
    t.string "usage_classification"
    t.datetime "hire_date"
    t.datetime "date_of_leaving_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "super_admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_super_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_super_admins_on_reset_password_token", unique: true
  end

  create_table "treatment_coordinators", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visit_routes", force: :cascade do |t|
    t.date "first_visit"
    t.date "second"
    t.date "treatment_plan_date"
    t.date "implant_correction"
    t.boolean "self_pay_contract"
    t.date "maintenance"
    t.boolean "treatment_plan"
    t.boolean "suspension"
    t.date "suspended_date"
    t.boolean "confirmation_end"
    t.date "end_date"
    t.boolean "maintenance_visit"
    t.date "maintenance_visit_date"
    t.boolean "contact_TEL"
    t.string "suspension_contact_TEL"
    t.boolean "contact_postcard"
    t.string "suspended_contact_postcard"
    t.string "visit_after_interruption"
    t.boolean "p_heavy_defense_target"
    t.date "p_heavy_defense_calculation_date"
    t.boolean "inspection_4mm"
    t.boolean "p_second"
    t.boolean "inspection_3"
    t.boolean "fop"
    t.boolean "whitening"
    t.boolean "medical_tube"
    t.string "mt_tooth_number"
    t.boolean "malocclusion"
    t.text "note"
    t.string "prosthodontics"
    t.date "next_reservation_date"
    t.boolean "thank_you_note"
    t.string "thank_you_note_patient_no"
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_visit_routes_on_patient_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clinics", "users"
  add_foreign_key "counselings", "patients"
  add_foreign_key "oral_types", "counselings"
  add_foreign_key "patients", "clinics"
  add_foreign_key "patients", "dentist_hygienists"
  add_foreign_key "patients", "dentists"
  add_foreign_key "patients", "treatment_coordinators"
  add_foreign_key "visit_routes", "patients"
end
