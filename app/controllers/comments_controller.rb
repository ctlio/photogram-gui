class CommentsController < ApplicationController

  def add_comment
    c = Comment.new
    c.photo_id = params.fetch("query_photo_id")
    c.author_id = params.fetch("query_author_id")
    c.body = params.fetch("query_comment")

    c.save

    #render({:template => "/comment_templates/add_comment"})
    redirect_url = "/photos/" + c.photo_id.to_s
    redirect_to(redirect_url)
  end

end 
