class PostController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]

# it is resemble to index page of post
def all
@posts = Post.all
end

# it is resemble to new page of post
def fresh
	@post = Post.new
end


# it is resemble to create page of post
def make
	@post = Post.new(post_parameter)

    if @post.save
         redirect_to @post, notice: 'Post was successfully made.'
       
      else
         render :fresh
        
    end
    
end

# it is resemble to show page of post
def watch

end


# it is resemble to edit page of post
def correction    
end

# it is resemble to update page of post
def change
if @post.update(post_parameter)
         redirect_to @post, notice: 'Post was successfully corrected.'
       
      else
         render :fresh
        
    end
end




# it is resemble to destroy page of post
def delete
	@post.destroy
         redirect_to @post, notice: 'Post was successfully destroyed.'
       
          
    
end


private

# Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

# Never trust parameters from the scary internet, only allow the white list through.
    def post_parameter
      params.require(:post).permit(:title, :description)
    end



end
