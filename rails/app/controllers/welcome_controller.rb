class WelcomeController < ApplicationController
  def index
    @title = "Welcome#index"
    @articles = Article.all

    session[:version] = "Ver.1.1.0"
  end
end
