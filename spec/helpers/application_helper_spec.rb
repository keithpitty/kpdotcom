require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe '#navbar_item' do
    it 'derives active navbar item' do
      allow(controller).to receive(:controller_name).and_return('contacts')
      actual = navbar_item('Contact', '/contact')
      expected = '<a class="text-white hover:text-white pr-4" href="/contact">Contact</a>'
      expect(actual).to eq(expected)
    end

    it 'derives non-active navbar item' do
      allow(request).to receive(:path).and_return('/contact')
      actual = navbar_item('Contact', '/contact')
      expect(actual).to eq('<a class="text-blue-300 hover:text-white pr-4" href="/contact">Contact</a>')
    end
  end

  describe '#coderay' do
    it 'formats via coderay with no lang defined' do
      input = <<EOF
<code>
$ CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline) --without-tcl --without-tk" rbenv install 1.8.7-p371
</code>
EOF
      expected = <<EOF

<notextile><div class="CodeRay">
  <div class="code"><pre>
$ CONFIGURE_OPTS=&quot;--with-readline-dir=$(brew --prefix readline) --without-tcl --without-tk&quot; rbenv install 1.8.7-p371
</pre></div>
</div>
</notextile>
EOF
      actual = coderay(input)
      expect(actual).to eq(expected)
    end

    it 'formats via coderay with lang defined' do
      input = <<EOF
<code lang="ruby">
class Foo
end
</code>
EOF
      expected = <<EOF
<code lang="ruby">
class Foo
end
</code>
EOF
      actual = coderay(input)
      expect(actual).to eq(expected)
    end
  end

  describe '#textilize' do
    it "derives link" do
      expected = "<p><a href=\"http://github.com\">GitHub</a></p>"
      actual = textilize("\"GitHub\":http://github.com")
      expect(actual).to eq(expected)
    end

    it "derives heading" do
      expected = "<h2>A second level heading</h2>"
      actual = textilize("h2. A second level heading")
      expect(actual).to eq(expected)
    end

    it "derives expected HTML containing emoji" do
      expected = "<p>Congratulations! <img alt=\"tada\" src=\"/images/emoji/unicode/1f389.png\" style=\"vertical-align:middle\" width=\"20\" height=\"20\" /></p>"
      actual = textilize("p. Congratulations! :tada:")
      expect(actual).to eq(expected)
    end
  end
end
