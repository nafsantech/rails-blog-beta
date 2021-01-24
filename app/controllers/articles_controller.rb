class ArticlesController < ApplicationController
	
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def show
	end

	def index
		@article = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		#render plain: params[:article]
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was created successfully"
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		if @article.update(article_params)
			flash[:notice] = 'Article edited successfully'
			redirect_to @article
		else
			redirect_to 'edit'
		end
	end

	def destroy
		if @article.delete
			flash[:notice] = 'Article deleted successfully'
			redirect_to articles_path
		else 
			flash[:notice] = 'Failed to delete'
		end
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description)
	end

end