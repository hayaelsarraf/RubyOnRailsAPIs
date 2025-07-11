# app/jobs/post_deletion_job.rb
class PostDeletionJob
  include Sidekiq::Job

  def perform(post_id)
    post = Post.find_by(id: post_id)
    post.destroy if post.present?
  end
end
