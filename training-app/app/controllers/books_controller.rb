# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!

  include Wor::Paginate

  def index
    render_paginated Book
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end
end
