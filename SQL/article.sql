DROP TABLE IF EXISTS `article`;
#文章表
create table article(
  article_id int unsigned auto_increment,
  user_id int comment '用户id',
  aticle_type_id int comment '文章类型',

  title varchar(150) not null default '' comment '文章标题',
  content varchar(5000)  not null default '' comment '文章内容',
  push_time  datetime comment '发布时间',
  updated datetime comment '修改时间',
  key_word varchar(150) not null default '' comment '文章关键字',
  primary key(article_id)
)engine=innodb auto_increment=1 default charset=utf8;