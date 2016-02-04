#!/bin/bash

echo "Checking for brew..."
BREW_PATH=`which brew`
if ["$BREW_PATH" == ""]; then
	echo "Installing brew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "OK!"

echo "Checking for PostgreSQL..."
POSTGRES_PATH=`which initdb`
if ["$POSTGRES_PATH" == ""]; then
	echo "Installing PostgreSQL..."
	brew install postgres
	&& initdb /usr/local/var/postgres
	&& mkdir -p ~/Library/LaunchAgents
	&& ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
	&& launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
	&& createdb bonsai_development
	&& createdb bonsai_production
	&& createdb bonsai_test
fi
echo "OK!"

echo "Checking for rails..."
RAILS_PATH=`which rails`
if ["$RAILS_PATH" == ""]; then
	echo "Installing rails..."
	gem install rails
	&& gem install pg -- --with-pg-config=/usr/local/bin/pg_config
fi
echo "OK!"


