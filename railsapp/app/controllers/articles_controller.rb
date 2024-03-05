class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
    @categories_of_article = @article.categories.name
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "スクラップが保存されました"
      redirect_to @article
    else
      flash[:alert] = "エラーが発生しました"
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "スクラップが更新されました"
      redirect_to @article
    else
      flash[:alert] = "エラーが発生しました"
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = 'スクラップが削除されました'
      redirect_to articles_url
    else
      flash[:alert] = 'エラーが発生しました'
      redirect_to articles_url
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:name, :url, category_ids: [])
    end
end
