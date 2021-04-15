require 'rails_helper'

describe BlogPost do

  def create_blog_post(params)
    blog_post = create(:blog_post,
                       title: params[:title],
                       post: params[:post],
                       published: true)
    blog_post.save
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

  context 'has existing posts' do
    let!(:post_1) {
      create(:blog_post,
             title: 'Post',
             post: 'test',
             published: true,
             published_at: Date.parse('2014-12-18').to_datetime)
    }
    let!(:post_2) {
      create(:blog_post,
             title: 'Post',
             post: 'test',
             published: true,
             published_at: Date.parse('2018-12-18').to_datetime)
    }

    describe '#has_previous_post?' do

      context 'has previous post' do
        it 'returns true' do
          expect(post_2.has_previous_post?).to be true
        end
      end

      context 'has no previous posts' do
        it 'returns false' do
          expect(post_1.has_previous_post?).to be false
        end
      end
    end

    describe '#has_next_post?' do

      context 'has next post' do
        it 'returns true' do
          expect(post_1.has_next_post?).to be true
        end
      end

      context 'has no next posts' do
        it 'returns false' do
          expect(post_2.has_next_post?).to be false
        end
      end
    end

    describe '#previous' do
      it 'returns previous post' do
        expect(post_2.previous).to eq(post_1)
      end
    end

    describe '#next' do
      it 'returns next post' do
        expect(post_1.next).to eq(post_2)
      end
    end
  end
end
