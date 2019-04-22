drop table if exists aricle_type;
#分类表
create table article_type(
  article_type_id int unsigned auto_increment,
  article_type_name varchar(30) not null default '' comment  '类型名称',
  article_type_description varchar(300) not null default ''  comment  '类型描述',
  primary key (article_type_id)
)engine=innodb auto_increment=1 default charset=utf8;;