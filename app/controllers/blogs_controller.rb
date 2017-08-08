class BlogsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_blog, only: [:edit, :update, :destroy]
  def index
    @blogs=Blog.all
#    binding.pry
#    raise
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end
  
  def edit
    # edit, update, destroyで共通コード
  end
  
  def update
    # edit, update, destroyで共通コード
    
    if @blog.update(blogs_params)
      redirect_to blogs_path, notice: "Instagramを更新しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    # edit, update, destroyで共通コード
    @blog.destroy
    redirect_to blogs_path, notice: "Instagramを削除しました！"
  end
  
  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
     # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to blogs_path, notice: "Instagramを新規作成しました！"
    else
      # エラー発生時に入力フォームを再描画します。
      render 'new'
    end
  end

  private
    def blogs_params
      params.require(:blog).permit(:title, :content, :user_id, :gzou, :gzou_cache)
    end
    
    # idをキーとして値を取得するメソッド
    def set_blog
      @blog = Blog.find(params[:id])
    end
end
