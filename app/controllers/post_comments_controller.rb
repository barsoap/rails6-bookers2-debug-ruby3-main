class PostCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    # @post_comment = PostComment.new(post_comment_params)
    # @post_comment.book_id = Book.find(params[:book_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.book_id = @book.id
    @comment.save
    # redirect_to request.referer #現在リクエストされているページへのリンクを持った直前のウェブページのアドレスが含まれています。
                              #そのため、上記のような記述をすることで、直前のページにredirectすることができます。
  end

  def destroy
    @postcomment = PostComment.find_by(params[:id])
    #↑ URLから、IDとコメントをした本のIDを取得・削除
    @postcomment.destroy
    # redirect_to request.referer
  end

  # book = Book.find(params[:book_id])
    # if post_comment.user == current_user
    #   post_commet.destroy
    #   redirect_to book_path(book)
    # else
    #   @book = book
    #   redirect_to book_path(book)
    # end

  private
    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end
end
