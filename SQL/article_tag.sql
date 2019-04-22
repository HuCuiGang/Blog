DROP TABLE IF EXISTS `article_tag`;
#标签表与文章表的多对多关系表
create table article_tag(
   article int ,
   tag_id int
)engine=innodb  default charset=utf8;