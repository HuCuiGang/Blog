DROP TABLE IF EXISTS `blog`;
#博客表
create table blog(
    blog_id int unsigned auto_increment,
    user_id int not null default 0,
    url varchar(50) not null default '',
    primary key(blog_id)
)engine=innodb auto_increment=1 default charset=utf8;