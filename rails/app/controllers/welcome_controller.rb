class WelcomeController < ApplicationController
  def index
    @title = "Welcome#index"
    @articles = Article.all
  end
end
