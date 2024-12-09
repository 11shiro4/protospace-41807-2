| カラム名 | データ型 | 制約 |


ユーザーズテーブル
| email              | string     | NOT NULL, UNIQUE |
| encrypted_password | string     | NOT NULL         |
| name               | string     | NOT NULL         | 
| profile            | text       | NOT NULL         |
| occupation         | text       | NOT NULL         |
| position           | text       | NOT NULL         |


プロトタイプテーブル
| title              | string     | NOT NULL          |
| catch_copy         | text       | NOT NULL          |
| concept            | text       | NOT NULL          |
| user               | references | NOT NULL          |


コメントテーブル
| content            | tex        | NOT NULL          |
| prototype          | references | NOT NULL          |
| user               | references | NOT NULL          |



