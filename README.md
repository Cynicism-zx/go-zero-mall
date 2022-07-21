# go-zero实战：让微服务Go起来
这是一个 `go-zero` 入门学习教程的 `DTM` 分布式事务示例代码，教程地址：[go-zero实战：让微服务Go起来](https://juejin.cn/post/7036011047391592485)。

#### 子事务屏障相关的表
```sql
create database if not exists dtm_barrier
/*!40100 DEFAULT CHARACTER SET utf8mb4 */
;
drop table if exists dtm_barrier.barrier;
create table if not exists dtm_barrier.barrier(
  id bigint(22) PRIMARY KEY AUTO_INCREMENT,
  trans_type varchar(45) default '',
  gid varchar(128) default '',
  branch_id varchar(128) default '',
  op varchar(45) default '',
  barrier_id varchar(45) default '',
  reason varchar(45) default '' comment 'the branch type who insert this record',
  create_time datetime DEFAULT now(),
  update_time datetime DEFAULT now(),
  key(create_time),
  key(update_time),
  UNIQUE key(gid, branch_id, op, barrier_id)
);
```

### 源码解读
- 服务注册: [注册01](https://blog.csdn.net/pyf511765/article/details/122015861) [注册02](https://www.cnblogs.com/leescre/p/14799586.html)
- 服务发现scheme:
  grpc 支持多种url schemes连接grpc服务 即 grpc.DialContext(timeCtx, target, options...),target可以是下边的scheme,需要先想grpc注册scheme 
  - dns:ip:port
  - unix://path
  - ipv4:ip:port
  - discov://ip:port/key // 自动获取etcd注册的服务地址并建立连接
- 负载均衡算法: [负载均衡](https://learnku.com/articles/60059)

### 集成gorm
- [go-zero集成gorm](https://blog.csdn.net/wanglei19891210/article/details/123258417)