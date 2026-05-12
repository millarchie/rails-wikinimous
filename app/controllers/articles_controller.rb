class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # empty instance for the form
    @article = Article.new
  end

  def create
    # this is a post request - we cannot access it from a url
    # only from submitting the form in new.html.erb
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      # redirect_to new_article_path => went to another place and with an empty article
      render :new, status: :unprocessable_entity # stays with the errored article and builds a form with that
    end
  end

  def edit
    # empty instance for the form
    @article = Article.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def article_params
    # Strong params -> whitelisting the attributes a user can give us
    params.require(:article).permit(:title, :content)
  end
end
