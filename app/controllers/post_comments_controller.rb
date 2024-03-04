class PostCommentsController < ApplicationController
  def create
    @post_comment = PostComment.new(post_comment_params)
    book = Book.find(params[:book_id])
    @post_comment.book_id = Book.find(params[:book_id])
    # comment = current_user.post_comments.new(post_comment_params)
    # comment.book_id = book.id
    if @post_comment.save
      redirect_to book_path(book.id)
    else
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    if post_comment.user == current_user
      post_commet.destroy
      redirect_to book_path(book)
    else
      @book = book
      redirect_to book_path(book)
    end
  end

  # def destroy
  # end

  private
    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end
end
