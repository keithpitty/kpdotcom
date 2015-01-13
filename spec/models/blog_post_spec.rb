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

  describe '#set_param' do
    it 'sets param from published_at for published post' do
      post = create(:blog_post,
                    title: 'Post',
                    post: 'test',
                    published: true,
                    published_at: Date.parse('2014-12-18').to_datetime)
      post.set_param
      expect(post.param).to eq('2014-12-18-post')
    end

    it 'sets param from current time for draft post' do
      post = create(:blog_post,
                    title: 'Post',
                    post: 'test',
                    published: false)
      post.set_param
      today_str = Time.zone.now.to_date.to_formatted_s(:db)
      expect(post.param).to eq("#{today_str}-post")
    end
  end

  describe '#set_published_at' do
    it 'should set using Time.zone.now' do
      post = create(:blog_post,
                    title: 'Post',
                    post: 'test',
                    published: false)
      Timecop.freeze(Time.now) do
        post.set_published_at
        expect(post.published_at).to eq(Time.zone.now)
      end
    end
  end
end
