DROP TABLE IF EXISTS `user`;
#用户表
CREATE TABLE user(
  user_id int UNSIGNED AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL DEFAULT '',
  nickname  VARCHAR(50) NOT NULL DEFAULT '',
  password VARCHAR(200) NOT NULL DEFAULT '',
  age int unsigned not null default 0,
  gender VARCHAR(5) NOT NULL DEFAULT '',
  phone VARCHAR(13) NOT NULL DEFAULT '',
  email VARCHAR(20) NOT NULL DEFAULT '',
  salt varchar(200) NOT NULL DEFAULT '',
  created datetime,
  updated datetime,
  last_login_time datetime,
  description varchar(999) NOT NULL DEFAULT '',
  user_status tinyint(1) not null default 0 comment '0正常1锁定2删除',
  primary key(user_id),
  unique key username(username),
  key user_status(user_status)
)engine=innodb auto_increment=1 default charset=utf8;