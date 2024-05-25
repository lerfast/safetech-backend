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

ActiveRecord::Schema[7.1].define(version: 2024_05_25_142452) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acknowledgments", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "date_received"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_acknowledgments_on_user_id"
  end

  create_table "ai_analyses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.json "input_data"
    t.json "output_data"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ai_analyses_on_user_id"
  end

  create_table "audits", force: :cascade do |t|
    t.date "audit_date"
    t.string "location"
    t.integer "auditor_id"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "capas", force: :cascade do |t|
    t.text "action_description"
    t.bigint "responsible_person_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "priority"
    t.string "status"
    t.bigint "incident_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_capas_on_incident_id"
    t.index ["responsible_person_id"], name: "index_capas_on_responsible_person_id"
  end

  create_table "complete_audits", force: :cascade do |t|
    t.text "scope"
    t.text "specific_questions"
    t.text "audit_details"
    t.text "corrective_actions"
    t.string "audit_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_complete_audits_on_user_id"
  end

  create_table "corrective_actions", force: :cascade do |t|
    t.text "action_description"
    t.string "responsible_person"
    t.date "start_date"
    t.date "end_date"
    t.string "priority"
    t.string "status"
    t.bigint "incident_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_corrective_actions_on_incident_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.integer "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_lists", force: :cascade do |t|
    t.string "title"
    t.json "items"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_custom_lists_on_user_id"
  end

  create_table "dashboards", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.json "data"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dashboards_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "document_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.json "form_data"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "help_resources", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "help_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_help_resources_on_user_id"
  end

  create_table "incident_reports", force: :cascade do |t|
    t.text "consequences"
    t.text "event_details"
    t.text "personal_injuries"
    t.text "asset_damage"
    t.string "event_severity"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_incident_reports_on_user_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.text "description"
    t.date "incident_date"
    t.date "reported_date"
    t.string "location"
    t.bigint "user_id", null: false
    t.string "severity"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.date "inspection_date"
    t.string "location"
    t.integer "inspector_id"
    t.integer "equipment_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id", null: false
    t.boolean "read_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_lists", force: :cascade do |t|
    t.string "title"
    t.json "items"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personal_lists_on_user_id"
  end

  create_table "qr_scans", force: :cascade do |t|
    t.string "data"
    t.datetime "scanned_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_qr_scans_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "report_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "role_assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_assignments_on_role_id"
    t.index ["user_id"], name: "index_role_assignments_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "safety_data_sheets", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "document_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_safety_data_sheets_on_user_id"
  end

  create_table "safety_meetings", force: :cascade do |t|
    t.string "title"
    t.datetime "meeting_date"
    t.string "location"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_safety_meetings_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "proficiency"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "sucursals", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_documents", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "document_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_system_documents_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "due_date"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trainings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_observations", force: :cascade do |t|
    t.text "description"
    t.datetime "observed_at"
    t.string "location"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_work_observations_on_user_id"
  end

  add_foreign_key "acknowledgments", "users"
  add_foreign_key "ai_analyses", "users"
  add_foreign_key "capas", "incidents"
  add_foreign_key "capas", "users", column: "responsible_person_id"
  add_foreign_key "complete_audits", "users"
  add_foreign_key "corrective_actions", "incidents"
  add_foreign_key "custom_lists", "users"
  add_foreign_key "dashboards", "users"
  add_foreign_key "documents", "users"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "users"
  add_foreign_key "forms", "users"
  add_foreign_key "help_resources", "users"
  add_foreign_key "incident_reports", "users"
  add_foreign_key "incidents", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "personal_lists", "users"
  add_foreign_key "qr_scans", "users"
  add_foreign_key "reports", "users"
  add_foreign_key "role_assignments", "roles"
  add_foreign_key "role_assignments", "users"
  add_foreign_key "safety_data_sheets", "users"
  add_foreign_key "safety_meetings", "users"
  add_foreign_key "skills", "users"
  add_foreign_key "system_documents", "users"
  add_foreign_key "tasks", "users"
  add_foreign_key "trainings", "users"
  add_foreign_key "work_observations", "users"
end
