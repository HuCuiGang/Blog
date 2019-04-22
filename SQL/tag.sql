DROP TABLE IF EXISTS `tag`;
#标签表
create table tag(
    tag_id int unsigned auto_increment,
    tag_name varchar(30) not null default '',
    primary key(tag_id)
)engine=innodb auto_increment=1 default charset=utf8;