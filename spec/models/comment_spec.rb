# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Comment, type: :model do
  context "ユーザー、記事が入力されているとき" do
    let(:user) { create(:user) }
    let(:article) { create(:article, user_id: user.id) }
    let(:comment) { build(:comment, user_id: user.id, article_id: article.id) }

    it "コメントが作成できる" do
      # comment = FactoryBot.build(:comment)
      expect(comment).to be_valid
    end
  end
end
