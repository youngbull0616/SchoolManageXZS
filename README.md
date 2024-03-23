<h1 align="center">学习管理系统 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-blue.svg?cacheSeconds=2592000" />
</p>

> 基于vue+springboot实现的学习管理系统

> 开发环境：

| 项目         |     版本 |
|------------|-------:|
| VUE        |  2.7.16 |
| SpringBoot |  2.1.6 |
| MySQL      |    8.0 |
| Node       | 16.x.x |


## 1.结构说明
> SQL文件夹：SQL语句存放目录
>
>  vue文件夹：前端源码
> 
>  xzs文件夹：后端源码
>
> 默认配置：前端端口8001，8002，8003,后端端口8000，数据库端口55001，账号root，密码123456，数据库名称xzs
***
## 2.安装说明
### （1）前端启动
在前端vue项目根目录运行下面的指令
```sh
npn install
```
运行下面指令👇构建前端项目
```sh
npn run build
```
运行下面指令👇启动前端项目
```sh
npn run serve
```
### （2）后端启动

```sh
运行XzsApplication.java
```

### (3)数据库导入
```sh
运行xzs.sql
```
## 3.配置修改

LYH/AttendanceManagerApi - idea/src/main/resources/application.yaml文件
```yaml
logging:
       path: ./log/

spring:
       datasource:
              url: jdbc:mysql://localhost:55001/xzs?useSSL=false&useUnicode=true&serverTimezone=Asia/Shanghai&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&allowPublicKeyRetrieval=true&allowMultiQueries=true
              username: root
              password: 123456
              driver-class-name: com.mysql.cj.jdbc.Driver
```
***
## 作者赠言

喜欢点个小心心⭐️ 有BUG在ISSUE里反馈

***
