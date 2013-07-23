* dev sandbox to read/try the book
    * [http://ruby.railstutorial.org/ruby-on-rails-tutorial-book](ruby on rails tutorial)
    * [http://theengguy.blogspot.com/2012/04/setting-up-os-x-lion-and-mountain-lion.html](instruction to prep env on moutain lion)
* prepare the dev env (on centos6.3)
```
cd ~
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins/
git clone git://github.com/sstephenson/ruby-build.git
sudo yum install -y make
rbenv install 1.9.2-p290
rbenv global 1.9.2-p290
rbenv local 1.9.2-p290
rbenv rehash 
gem install pry pry-doc bundler teamocil wirble

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile

# --- ~/.irbrc
begin
  # load wirble
  require 'wirble'

  # start wirble (with color)
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

```
