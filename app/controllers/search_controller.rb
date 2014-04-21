class SearchController < ApplicationController
  def index
    search_text_var = params[:search_text];
    @search_type = params[:search_type];
    session[:search_text] = search_text_var;

    if @search_type == nil
      @search_type = 'publication'
    end

    if @search_type == 'publication'
      @publications = Publication.where('title like ?', "%#{search_text_var}%").limit(20)
      @questions = nil
      @reviews = nil
    elsif @search_type == 'question'
      @publications = nil
      @questions = Question.where('title like ?', "%#{search_text_var}%").limit(20)
      @reviews = nil
    elsif @search_type == 'review'
      @publications = nil
      @questions = nil;
      @reviews = Review.where('title like ?', "%#{search_text_var}%").limit(20)
    end

    respond_to do |format|
      format.js
      format.html
    end

  end




end
