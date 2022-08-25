# README
## 環境
* Ruby version <br>
ruby 3.0.1p64
* PostgreSQL version<br>
postgresql 12
* Rails version<br>
Rails 6.1.6.1

## 起動方法
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

## DB設計について決まり事
モデルを作成する際には必ず```ID```と```created_at```，```updated_at```が含まれていると思うが，IDについてはUUIDになっている．UUIDとは128ビットの数値で16進数で表される数値で表されることが多い．以下のように．
```
550e8400-e29b-41d4-a716-446655440000
```
以下のように実行すると
```
rails g model fuga foobar:hoge
```
以下のようなidをuuidとする旨の記述が自動的に含まれたマイグレーションファイルが生成されることになっている．
``` rb
class CreateFugas < ActiveRecord::Migration[6.1]
  def change
    create_table :fugas, id: :uuid do |t|
      t.hoge :foobar

      t.timestamps
    end
  end
end
```
留意をば．