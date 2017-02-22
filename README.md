
#Datomic 商业版

目前版本为：0.9.5394

## 运行

datomic容器依赖后端存储dynamodb Local容器进行开发测试。

方式一：

    docker-compose -f ./docker-compose.yml up -d

方式二：

    DYNAMODB_HOSTIP: 为容器所在的宿主IP。

    docker run -d  -p 8000:8000 hjdzyh/dynamodb-local

    docker run -d -p 4334:4334 -e DYNAMODB_HOSTIP=$(DDB_HOST_IP):8000 dev.flybot.sg:4567/zyh/docker-datomic-dynamodb:0.9.5394


你可以使用自己的配置文件覆盖容器中默认的配置文件：

    docker run -it --rm -p 4334:4334 -v $(pwd)/config:/opt/datomic-pro-0.9.5394/config dev.flybot.sg:4567/zyh/docker-datomic-dynamodb:0.9.5394

容器启动后，占用宿主主机4334、8000端口，peer可以使用以下地址连接：

    datomic:ddb-local://localhost:8000/local-test/<数据库名称>?aws_access_key_id=test&aws_secret_key=test

    datomic:ddb-local://localhost:8000/local-test/*?aws_access_key_id=test&aws_secret_key=test

例子：

zyh@local ~/d/datomic-pro-0.9.5394> ./bin/groovysh

Groovy Shell (1.8.9, JVM: 1.8.0_65)

groovy:000> import datomic.Peer

groovy:000> url = "datomic:ddb-local://localhost:8000/local-test/testdb?aws_access_key_id=test&aws_secret_key=test"

groovy:000> Peer.createDatabase(url)

groovy:000> url2 = "datomic:ddb-local://localhost:8000/local-test/*?aws_access_key_id=test&aws_secret_key=test"

groovy:000> Peer.getDatabaseNames(url2)

Peer.getDatabaseNames(url2)

===> ("testdb")

##发布：
正式使用的时候，请使用商业版的license key以及aws证书.
