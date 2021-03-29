class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_actionはアクションを実行する前にフィルターをかけるメソッド
  # 今回は、postsコントローラーのnewアクションやcreateアクションを実行する前にauthenticate_user!を読み込む。
  # これで、サインインしていない状態でnewアクションやcreateアクションを実行しようとすると、サインインページにリダイレクトできる。

  def new
    @post = Post.new
    # newはインスタンスを作成するメソッド。引数がなければ空のインスタンスが作成される。
    @post.photos.build
    # buildもインスタンスを作成するメソッド。モデル(今回はpostとphoto)を関連付けするときに使う。
  end

  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  private
  # privateではレシーバを指定できない。通常はレシーバにメソッドを合わせて使用するができない。つまり外部から呼び出せない。
    def post_params
      params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
      # requireメソッド：受け取る値のキーを設定する。
      # permitメソッド：変更を加えられるキーを指定する。今回はcaptionとimage。
      # mergeメソッド：2つのハッシュを統合する。今回は誰が投稿したか情報が必要なため、user_idを統合する。
    end
end
