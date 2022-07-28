# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 3.0.1p64
* System dependencies
postgresql 12
* Configuration

* Database creation

* Database initialization
postgresql を起動
```
sudo /etc/init.d/postgresql start
```
ロールを作成
```
su - postgres
psql
CREATE ROLE [your username] WITH SUPERUSER;
ALTER ROLE [your username] WITH LOGIN PASSWORD '[your password]';
exit
exit
```
```
cd kuina_map_backend
rails db:create
rails db:migrate
```
以上で起動できると思われ
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
