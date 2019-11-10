FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    bzip2 \
    ca-certificates \
    curl \
    libffi-dev \
    libgdbm3 \
    libssl-dev \
    libyaml-dev \
    procps \
    zlib1g-dev \
    git-core \
    curl \
    zlib1g-dev \
    build-essential \
    libssl-dev \
    libreadline-dev \
    libsqlite3-dev \
    sqlite3 \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \
    python-software-properties \
    checkinstall \
    wget \
    libmagickcore-dev \
    libmagickwand-dev \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# skip installing gem documentation
RUN mkdir -p /usr/local/etc \
    && { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
    } >> /usr/local/etc/gemrc

# ENV RUBY_MAJOR 2.1
# ENV RUBY_VERSION 2.1.2
# ENV RUBYGEMS_VERSION 2.6.6

# some of ruby's build scripts are written in ruby
# we purge this later to make sure our final image uses what we just built
RUN set -ex \
    && buildDeps=' \
    autoconf \
    bison \
    gcc \
    libbz2-dev \
    libgdbm-dev \
    libglib2.0-dev \
    libncurses-dev \
    libreadline-dev \
    libxml2-dev \
    libxslt-dev \
    make \
    ruby \
    ' \
    && apt-get update 
# && apt-get install -y --no-install-recommends $buildDeps \
# && rm -rf /var/lib/apt/lists/* \
# && curl -fSL -o ruby.tar.gz "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.gz" \
# && mkdir -p /usr/src/ruby \
# && tar -xzf ruby.tar.gz -C /usr/src/ruby --strip-components=1 \
# && rm ruby.tar.gz \
# && cd /usr/src/ruby \
# && { echo '#define ENABLE_PATH_CHECK 0'; echo; cat file.c; } > file.c.new && mv file.c.new file.c \
# && autoconf \
# && ./configure --disable-install-doc \
# && make -j"$(nproc)" \
# && make install \
# && apt-get purge -y --auto-remove $buildDeps \
# && gem update --system $RUBYGEMS_VERSION \
# && rm -r /usr/src/ruby

# ENV BUNDLER_VERSION 1.13.0


# install things globally, for great justice
# and don't create ".bundle" in all our apps
# ENV GEM_HOME /usr/local/bundle
# ENV BUNDLE_PATH="$GEM_HOME" \
#     BUNDLE_BIN="$GEM_HOME/bin" \
#     BUNDLE_SILENCE_ROOT_WARNING=1 \
#     BUNDLE_APP_CONFIG="$GEM_HOME"
# ENV PATH $BUNDLE_BIN:$PATH
# RUN mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
#     && chmod 777 "$GEM_HOME" "$BUNDLE_BIN"


RUN git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
RUN echo 'export PATH="/root/.rbenv/bin:$PATH"' >> ~/.bashrc
ENV PATH="/root/.rbenv/bin:$PATH"
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN eval "$(rbenv init -)"

RUN git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN echo 'export PATH="/root/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
ENV PATH="/root/.rbenv/plugins/ruby-build/bin:$PATH"

RUN git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

RUN git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs

RUN /root/.rbenv/bin/rbenv install 2.1.2
RUN /root/.rbenv/bin/rbenv rehash
RUN /root/.rbenv/bin/rbenv global 2.1.2

RUN /root/.rbenv/shims/gem install bundler -v 1.9.8
RUN /root/.rbenv/shims/bundle -v

RUN cd ~
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN wget http://www.imagemagick.org/download/releases/ImageMagick-6.7.7-10.tar.xz
RUN tar xf ImageMagick-6.7.7-10.tar.xz
RUN pwd
WORKDIR /myapp/ImageMagick-6.7.7-10
RUN pwd
RUN ls -la
RUN ./configure
RUN make
RUN checkinstall
RUN ldconfig /usr/local/lib
RUN identify -version
RUN pwd
WORKDIR /myapp
RUN pwd
RUN /root/.rbenv/shims/gem install rmagick -v '2.13.4'
RUN /root/.rbenv/shims/bundle install --quiet
COPY . /myapp

# Start the main process.
RUN env
ENV PATH="/root/.rbenv/shims:$PATH"
ENV RUBY_PATH="/root/.rbenv/shims/ruby"
RUN echo 'export PATH="/root/.rbenv/shims:$PATH"' >> ~/.bashrc
RUN echo 'export RUBY_PATH="/root/.rbenv/shims/ruby"' >> ~/.bashrc
RUN env
ENV RAILS_ENV=development
RUN env

RUN apt-get install -y --no-install-recommends postgresql-client
CMD ["bash", "-l", "/root/.rbenv/shims/rails", "server", "-b", "0.0.0.0"]
