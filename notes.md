A person that can BLOG about the competition 

User
- has_many: performances                        #that they can blog about
- has_many :performances, through: :comments

 
has_secure_password

- name
- email
- username
- password_digest 
- uid
- provider 


Performances 
- has_many :users_comment, through: :comments
- has_many :users

- Round
- Date
- Duration 
- Piece
- video 
- performer

Comments ** this is the joins table 
- belongs_to :user
- belongs_to :performances

-content