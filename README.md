## users テーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, add_index|
|email|text|null: false|
|sex|string|null: false|
|image|text|
|height|integer|
|body|string|
|bloodtype|string|
|occupation|
|area|string|
|hometown|string|
|education|string|
|tobacco|string|
|hobby|string|
|nickname|string|
|age|integer|
|sibling|string|
|nationality|string|
|language|string|
|introduction|text|


### Association
- has_many :groups, through: groups_users
- has_many :groups_users
- has_many :messages
- has_many :active_relationships, class_name: "Relastionship", foreign_key: "follower_id", dependent: :destroy
- has_many :following, through: :active_relationships, source: :following
- has_many :passive_relationship, class_name:"Relationship", foreign_key: "following_id", dependent: :destroy
- has_many :followers, through: :passive_relationships, source: :follower

## groups_users テーブル
|Column|Type|Option|
|------|----|------|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## groups テーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true, add_index|
|image|text|
|user_id|integer|null: false, foreign_key: true|


### Association
- has_many :users, through: groups_users
- has_many :groups_users

## messages テーブル
|Column|Type|Option|
|------|----|------|
|message|text|
|image|text|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :users

##relationship_table
