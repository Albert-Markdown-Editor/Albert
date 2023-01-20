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

ActiveRecord::Schema[7.0].define(version: 2023_01_20_083452) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "blog_posts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.date "release_date"
    t.uuid "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_blog_posts_on_project_id"
  end

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.date "release_date"
    t.uuid "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_books_on_project_id"
  end

  create_table "document_fragments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type", null: false
    t.integer "position", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "document_id", null: false
    t.index ["document_id"], name: "index_document_fragments_on_document_id"
    t.index ["id"], name: "index_document_fragments_on_id"
  end

  create_table "documents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.uuid "project_id"
    t.index ["id"], name: "index_documents_on_id"
    t.index ["name"], name: "index_documents_on_name"
    t.index ["project_id"], name: "index_documents_on_project_id"
  end

  create_table "friendly_id_slugs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "slug", null: false
    t.uuid "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "projects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["id"], name: "index_projects_on_id"
    t.index ["name"], name: "index_projects_on_name"
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  add_foreign_key "blog_posts", "projects"
  add_foreign_key "books", "projects"
  add_foreign_key "document_fragments", "documents"
  add_foreign_key "documents", "projects"

  create_view "project_deliverables", sql_definition: <<-SQL
      SELECT
          CASE
              WHEN (books.id IS NOT NULL) THEN 'Book'::text
              WHEN (blog_posts.id IS NOT NULL) THEN 'BlogPost'::text
              ELSE NULL::text
          END AS kind,
      COALESCE(books.id, blog_posts.id) AS id,
      COALESCE(books.title, blog_posts.title) AS name,
      COALESCE(books.summary, blog_posts.summary) AS summary,
      COALESCE(books.release_date, blog_posts.release_date) AS release_date,
      COALESCE(books.project_id, blog_posts.project_id) AS project_id
     FROM (books
       FULL JOIN blog_posts USING (id, title, summary, release_date, project_id, created_at, updated_at));
  SQL
end
