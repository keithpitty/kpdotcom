require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe '#navbar_item' do
    it 'derives active navbar item' do
      allow(controller).to receive(:controller_name).and_return('contacts')
      actual = navbar_item('Contact', '/contact')
      expected = '<li class="active"><a href="/contact">Contact</a></li>'
      expect(actual).to eq(expected)
    end

    it 'derives non-active navbar item' do
      actual = navbar_item('Contact', '/contact')
      expect(actual).to eq('<li><a href="/contact">Contact</a></li>')
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
  end
end
