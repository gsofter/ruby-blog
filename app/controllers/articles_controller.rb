class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", exept: [:index, :show]
  def new
    @article = Article.new
  end
  def index
    @articles = Article.all
  end
  def edit
    @article = Article.find(params[:id])
  end
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  def show
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to
    else
      render 'edit'
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to article_path
  end
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end