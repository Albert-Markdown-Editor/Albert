# frozen_string_literal: true

module Editor
  class DocumentsController < ApplicationController
    include DocumentSetters

    before_action :set_document, only: [:show]

    # GET /editor/<document_id>
    def show
    end

    # GET /editor/create
    def new
    end
  end
end
