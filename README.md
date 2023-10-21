## よく使うコマンド
```
git checkout main
```
```
git pull origin main --rebase
```

ブランチの削除
```
git branch -D products
```

```
git push heroku products-sub:main
```

```
http://localhost:3000/rails/info/routes
```

```
sudo chmod -R 777 /home/okuyama/rails_ec/
```

heroku run rails db:migrate

https://peaceful-waters-90263-196a9ea53a5c.herokuapp.com/ deployed to Heroku

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

## 備考

- Taskのscaffoldが含まれていますが、CIの動作確認用です。
適宜削除いただければと思います。（そのままでも問題ないです）

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
