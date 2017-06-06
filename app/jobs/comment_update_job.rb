class CommentUpdateJob < ApplicationJob
  queue_as :default

  def perform(comment, current_user)
    ProductChannel.broadcast_to comment.product_id, comment: comment, average_rating: @product.average_rating
  end

  private

  def render_comment(comment, current_user)
    CommentsController.render(partial: 'products/comments', locals: { comment: comment, current_user: current_user })
  end

end
