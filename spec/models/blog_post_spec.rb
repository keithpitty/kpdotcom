require 'rails_helper'

describe BlogPost do
  describe '.find_published_tagged_with' do
    before do
      create(:blog_post,
             title: 'Post 1',
             post: 'test',
             tag_list: 'tag1',
             published: true)
      create(:blog_post,
             title: 'Post 2',
             post: 'test',
             tag_list: 'tag1',
             published: true)
      create(:blog_post,
             title: 'Post 3',
             post: 'test',
             tag_list: 'tag2',
             published: true)
    end

    it 'returns published posts with tag' do
      posts = BlogPost.find_published_tagged_with('tag1')
      expect(posts.count).to eq(2)
      expect(posts.map(&:tag_list).flatten).to eq(['tag1', 'tag1'])
    end
  end
end
