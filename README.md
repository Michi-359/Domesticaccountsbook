# 作品
### herokuURL

https://domesticaccountsbook-45bfd8f309b7.herokuapp.com/

# アプリについて

家計簿を作成して、支出の項目ごとに全国平均との比較ができます。世帯人数、住居形態(持ち家、賃貸など)、年収を入力した場合は、その属性ごとの支出の全国平均を表示することができます。また、目標貯金額を設定して進捗状況を確認する機能、節約のコツを投稿、他人の投稿を閲覧することができる機能もあります。

# 技術
### フロントエンド
| 使用技術 | 詳細 |
| --- | --- |
| HTML/CSS | web開発の基本技術 |
| Bootstrap | CSSフレームワーク |

### バックエンド
| 使用技術 | 詳細 |
| --- | --- |
| Ruby 3.2.4 | プログラミング言語 |
| Rails 7.1.5 | |
| MySQL | データベース |
| Devise | ログイン、ゲストログイン機能の実装 |
| RuboCop | コードスタイルの一貫性を維持 |
| Rspec | リクエストスペック・システムスペック・モデルスペックのテストを実行 |

###　インフラ
| 使用技術 | 詳細 |
| --- | --- |
| Heroku | デプロイ先 |

# インフラ構成図
![インフラ構成図 drawio](https://github.com/user-attachments/assets/a3ca6388-8a7d-4c59-85ae-13e9b998490d)

# ER図
<img width="1470" alt="スクリーンショット 2025-01-20 2 41 10" src="https://github.com/user-attachments/assets/8e01f69c-ff0a-49f3-aeb2-bb70f74ea670" />

# 機能一覧
| 機能名 | 説明 |
| --- | --- |
| ユーザー新規登録・ログイン機能 | Deviseを使用して実装しました。ゲストログイン機能もあります。 |
| 家計簿の登録機能 | 家計簿を登録できます。 |
| 目標貯金額と進捗状況の登録機能 | 目標貯金額を設定し、毎月貯める金額などを入力すれば、進捗状況を表示することができます。 |
| 節約のコツの投稿・閲覧機能 | 節約のコツを投稿することができます。投稿されたものは、全てのユーザーが閲覧できます。(他の機能で作成したものは作成したユーザーのみ閲覧できます。) |
