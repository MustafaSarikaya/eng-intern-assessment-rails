class ArticlesController < ActionController::Base
    def index
        @articles = Article.all
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

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path, status: :see_other
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render articles_path, status: :unprocessable_entity
        end
    end

    private
        def article_params
            params.require(:article).permit(:title, :content, :author, :date)
        end    
end
