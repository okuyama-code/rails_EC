## 以前作成した完成コードのブランチ　create_me

## githubソースコード　＆　ディレクトリ場所
https://github.com/okuyama-code/rails_ec
ubuntuの ~/rails_ec

## プロモーションコード作成
rake promotion_code:generate
PromotionCode.all

## よく使うコマンド
```
git checkout main
```
```
git pull origin main --rebase
```

docker compose run --rm web bundle exec rubocop -A


ブランチの削除
```
git branch -D products
```

```
git push heroku products-sub:main
```

```
git push heroku promotion_code:main
```

```
http://localhost:3000/rails/info/routes
```

```
sudo chmod -R 777 /home/okuyama/rails_ec/
```

heroku run rails db:migrate



# README

課題用のrailsテンプレートです。

## 前提

- dockerが必要です。

## setup

```
docker compose build
```

```
docker compose run --rm web bin/setup
```


```
docker compose run --rm web yarn install
```

## run

```
docker compose up
```

http://localhost:3000



## rubocop

rubocopがすべて通ってからレビュー依頼を出してください。

auto correct

```
docker compose run --rm web bundle exec rubocop -A
```

## htmlbeautifier

erbのフォーマッターです。
フォーマッターを通してからレビュー依頼を出してください。

```
docker compose run --rm web bin/htmlbeautifier
```
