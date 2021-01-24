class ArticlesController < ApplicationController
	def index
		@article = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		#render plain: params[:article]
		@article = Article.new(params.require(:article).permit(:title, :description))
		if @article.save
			flash[:notice] = "Article was created successfully"
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(params.require(:article).permit(:title, :description))
			flash[:notice] = 'Article edited successfully'
			redirect_to @article
		else
			redirect_to 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		if @article.delete
			flash[:notice] = 'Article deleted successfully'
			redirect_to articles_path
		else 
			flash[:notice] = 'Failed to delete'
		end
	end
end